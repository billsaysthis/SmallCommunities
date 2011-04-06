class Photo < ActiveRecord::Base
  has_and_belongs_to_many :lookups
  
  def self.get_block blockname
    Lookup.where(:group => blockname).photos
  end
end
