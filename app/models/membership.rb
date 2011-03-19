class Membership < ActiveRecord::Base
  belongs_to :user

  scope :active_users, where(:year => Setting.retrieve('current_year'))
  scope :sponsors, where(:mtype => 'sponsor')
  scope :gold_members, where(:mtype => 'gold')

  validates :year, :presence => true
  validates :mtype, :presence => true, :inclusion => %w(sponsor gold regular student senior)
  
end
