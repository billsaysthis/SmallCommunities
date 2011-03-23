class Speaker < ActiveRecord::Base
  has_many :presentations
  has_many :events, :through => :presentations
  
  validates :name, :presence => true
  validates :url, :uri => { :schemes => [:http] }
  validates :image_url, :uri => { :schemes => [:http] }
  
  scope :past, joins(:events).where('events.occurs_on > ?'Date.current).order("events.occurs_on DESC")
end