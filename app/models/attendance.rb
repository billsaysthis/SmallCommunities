class Attendance < ActiveRecord::Base
  has_many :users
  has_many :events
end