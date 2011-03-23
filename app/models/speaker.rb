class Speaker < ActiveRecord::Base
  has_many :presentations
  has_many :events, :through => :presentations
  
  validates :name, :presence => true
end