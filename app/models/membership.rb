class Membership < ActiveRecord::Base
  belongs_to :user

  validates :year, :presence => true
  validates :mtype, :presence => true, :inclusion => configatron.memberships
  
end
