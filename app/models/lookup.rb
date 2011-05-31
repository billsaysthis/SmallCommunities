class Lookup < ActiveRecord::Base
  has_and_belongs_to_many :photos
  
  # def label
  #   group + ' - ' + value
  # end
end
