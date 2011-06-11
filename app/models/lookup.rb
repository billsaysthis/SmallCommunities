class Lookup < ActiveRecord::Base
  has_and_belongs_to_many :photos
  
  def to_s
    group + ' - ' + value
  end
end
