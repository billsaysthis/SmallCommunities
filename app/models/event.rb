class Event < ActiveRecord::Base
  has_many :presentations
  has_many :speakers, through: :presentations
  has_many :rsvps
  has_many :users, through: :rsvps
  has_and_belongs_to_many :paypals

  EVT_ACTIVE_STATUSES = %w(on_sale at_door)
  EVT_INACTIVE_STATUSES = %w(sold_out past)
  
  validates :title, presence: true
  validates :occurs_on, presence: true
  validates :status, inclusion: {in: EVT_ACTIVE_STATUSES + EVT_INACTIVE_STATUSES}
  validates :page_template, presence: true
  
  attr_accessible :title, :subtitle, :occurs_on, :description, :page_template

  class << self
    def future_events
      where("occurs_on > ?", Date.current).order("occurs_on DESC")
    end

    def past_events
      where("occurs_on < ?", Date.current).order("occurs_on DESC")
    end

    def current_year
      where(:occurs_on => Date.current.beginning_of_year..Date.current.end_of_year).order(:occurs_on)
    end

    def current
      where("occurs_on > ?", Date.current).order(:occurs_on).limit(1)
    end

    def current_event
      Event.current.first
    end

    # TODO This needs to calculate the next logical date from Date.current, not the next logical date after the last event in the DB
    def tba
      last_event = Event.where("occurs_on < ?", Date.current).limit(1).order("occurs_on DESC").first
      last_plus_one = self.next_event(last_event.present? ? last_event.occurs_on : Date.current.beginning_of_month)
      # 'To Be Announced', 'Date is tentative until program is confirmed.'
      Event.new({title: Setting.retrieve('default_event_title'), page_template: 'event', occurs_on: last_plus_one, description: Setting.retrieve('default_event_description')})
    end

    def next_event last_date
      # defaults to second Tuesday of the next month
      nm = last_date.next_week(self.default_meeting_day)
      until valid_next_event_date(nm)
        nm = nm.next_week(self.default_meeting_day)
      end
      nm
    end

    def valid_next_event_date nxdt
      dmw = self.default_meeting_week
      stdt = dmw*7 || 1
      eddt = stdt + 7
      nxdt >= Date.current and ((nxdt.day > stdt) and (nxdt.day < eddt))
    end

    def default_meeting_day
      # 'w:2,d:tuesday'
      Setting.find_by_name("default_next_event_date").value.split(",").last.split(":").last.to_sym
    end

    def default_meeting_week
      # 'w:2,d:tuesday'
      Setting.find_by_name("default_next_event_date").value.split(",").first.split(":").last.to_i - 1
    end
  end
  
  def is_current?
    Event.current_event.present? ? Event.current_event == self : false
  end
  
  def change_status(new_status)
    status = new_status
    save!
  end
  
  def active?
    EVT_ACTIVE_STATUSES.include? status
  end
  
  def on_sale?
    status == 'on_sale'
  end
  
  def soldout?
    status == 'sold_out'
  end
  
  def at_door?
    status == 'at_door'
  end
  
  def special_paypal
    self.paypals.where(button_type: 'special').first || nil
  end
  
  def regular_paypal
    self.paypals.where(button_type: 'regular').first || nil
  end
  
  def to_ics
    event = Icalendar::Event.new
    event.start = occurs_on.strftime("%Y%m%dT%H%M%S")
    event.end = (occurs_on + int_Setting.retrieve('event_length').minutes).strftime("%Y%m%dT%H%M%S")
    event.summary = Setting.retrieve('short_name') + ': ' + title
    spkrs = speakers.collect {|s| s.name}
    spkrs = speakers.present? ? "Speakers: " + spkrs.join(", ") : ""
    event.description = self.description.gsub(/<br\/>/, '\n') + '\n\n' + spkrs
    event.url = Setting.retrieve('corp_url')
    event.location = location
    event.klass = "PUBLIC"
    event.created = created_at
    event.last_modified = updated_at
    event
  end
  
  def check_status
    change_status('past') if occurs_on < Date.current and status != 'past'
  end
  
  # for RailsAdmin dropdown
  def status_enum
    %w(on_sale at_door sold_out past)
  end
  
end
