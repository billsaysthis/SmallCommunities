class Membership < ActiveRecord::Base
  belongs_to :user

  validates :year, :presence => true
  validates :mtype, :presence => true, :inclusion => configatron.memberships
  
  scope :current, where(:year => Date.current.year.to_s)
  
  attr_accessible :mtype, :year
end
