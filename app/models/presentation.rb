class Presentation < ActiveRecord::Base
  belongs_to :speaker
  belongs_to :event
  
  validates :presentation_url, :uri => { :schemes => [:http] }
end