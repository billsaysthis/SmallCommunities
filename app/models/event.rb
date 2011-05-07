class Event < ActiveRecord::Base
  has_many :presentations
  has_many :speakers, :through => :presentations
  has_many :rsvps
  has_many :users, :through => :rsvps

  EVT_ACTIVE_STATUSES = %w(on_sale at_door)
  EVT_INACTIVE_STATUSES = %w(sold_out past)
  
  validates :title, :presence => true
  validates :occurs_on, :presence => true
  validates :status, :inclusion => {:in => EVT_ACTIVE_STATUSES + EVT_INACTIVE_STATUSES}
  validates :page_template, :presence => true
  
  scope :future_events, lambda {where("occurs_on > ?", Date.current).order("occurs_on DESC")}
  scope :past_events, lambda {where("occurs_on < ?", Date.current).order("occurs_on DESC")}
  scope :current_year, lambda {where(:occurs_on => Date.current.beginning_of_year..Date.current.end_of_year).order(:occurs_on)}
  scope :current, lambda {where("occurs_on > ?", Date.current).order(:occurs_on).limit(1)}
  
  attr_accessible :title, :subtitle, :occurs_on, :special_paypal, :regular_paypal, :description, :page_template

  def self.current_event
    Event.current.first
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
  
  # TODO This needs to calculate the next logical date from Date.current, not the next logical date after the last event in the DB
  def self.tba
    last_event = Event.where("occurs_on < ?", Date.current).limit(1).order("occurs_on DESC").first
    last_plus_one = last_event.present? ? self.next_event(last_event.occurs_on) : self.next_event(Date.current.beginning_of_month)
    # 'To Be Announced', 'Date is tentative until program is confirmed.'
    Event.new({:title => Setting.retrieve('default_event_title'), :page_template => 'event', :occurs_on => last_plus_one, :description => Setting.retrieve('default_event_description')})
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
  
  def self.next_event last_date
    # defaults to second Tuesday of the next month
    last_date.month.next.second_tuesday
  end
  
  def check_status
    change_status('past') if occurs_on < Date.current and status != 'past'
  end
end
