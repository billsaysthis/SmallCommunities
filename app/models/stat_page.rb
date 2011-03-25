class StatPage < ActiveRecord::Base
  validates :title, :presence => true #, :unique => true
  validates :content, :presence => true
end
