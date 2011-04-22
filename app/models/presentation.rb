require 'uri_validation'

class Presentation < ActiveRecord::Base
  include URI_Validation
  belongs_to :speaker
  belongs_to :event

  validates :presentation_url, :url => true
end