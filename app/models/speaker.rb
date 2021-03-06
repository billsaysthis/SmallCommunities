require 'uri_validation'
class Speaker < ActiveRecord::Base
  include URI_Validation
  has_many :presentations
  has_many :events, :through => :presentations
  
  validates :name, :presence => true
  validates :url, :url => true
  validates :image_url, :url => true
  
  scope :past, joins(:events).where('events.occurs_on > ?',Date.current).order("events.occurs_on DESC")
end