class StatPage < ActiveRecord::Base
  validates :title, :presence => true #, :unique => true
  # must have at least ONE content block
  validates :content1, :presence => true
  
  scope :active, where(:active => true)
  default_scope order("title")
end
