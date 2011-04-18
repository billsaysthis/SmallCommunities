class Presentation < ActiveRecord::Base
  include URI_Validation
  belongs_to :speaker
  belongs_to :event
  
  validates :presentation_url, :uri => true
end