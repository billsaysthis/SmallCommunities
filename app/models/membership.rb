class Membership < ActiveRecord::Base
  belongs_to :user

  validates :year, :presence => true
  validates :mtype, :presence => true, :inclusion => [t(:sponsor_member), t(:premium_member), t(:regular_member), t(:student_member), t(:senior_member)]
  
end
