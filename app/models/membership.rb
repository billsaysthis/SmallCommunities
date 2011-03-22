class Membership < ActiveRecord::Base
  belongs_to :user

  scope :active_users, where(:year => Setting.retrieve('current_year'))
  scope :sponsors, where(:mtype => t(:sponsor_member))
  scope :gold_members, where(:mtype => t(:premium_member))

  validates :year, :presence => true
  validates :mtype, :presence => true, :inclusion => [t(:sponsor_member), t(:premium_member), t(:regular_member), t(:student_member), t(:senior_member)]
  
end
