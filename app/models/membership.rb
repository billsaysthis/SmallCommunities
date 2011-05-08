class Membership < ActiveRecord::Base
  belongs_to :user

  validates :year, :presence => true
  validate :validate_year
  validates :mtype, :presence => true, :inclusion => configatron.memberships
  
  scope :current, where(:year => Date.current.year.to_s)
  
  attr_accessible :mtype, :year
  
  def validate_year
    errors.add(:base, "Year must be between #{valid_years.first} and #{valid_years.last}") unless valid_years.include?(year.to_i)
  end
  
  private
  def valid_years
    st_year = Setting.find_by_name("earliest_valid_year").value.to_i
    ed_year = Date.current.year + 1
    st_year..ed_year
  end
end
