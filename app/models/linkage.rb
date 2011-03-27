class Linkage < ActiveRecord::Base
  validate :label, :presence => true
  validate :url, :presence => true
  validate :link_type, :presence => true
  
  has_many :sub_navs, :class_name => "Linkage", :foreign_key => :parent_id
  belongs_to :top_nav, :class_name => "Linkage"
  
  scope :active, where(:active => true)
  scope :tops, where(:parent_id => nil)
  scope :nav, where(:link_type => 'nav')
  scope :social, where(:link_type => 'social')
  default_scope order("parent_id, position")
  
end
