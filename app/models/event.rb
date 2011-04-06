class Event < ActiveRecord::Base
  has_many :presentations
  has_many :speakers, :through => :presentations
  has_many :rsvps
  has_many :users, :through => :rsvps

  validates :title, :presence => true
  validates :occurs_on, :presence => true
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
    if Event.current_event.present?
      occurs_on > Event.current_event.occurs_on
    else
      true
    end
  end
  
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
    (last_date + 1.month).beginning_of_month.next_week + 1.day
  end
end
