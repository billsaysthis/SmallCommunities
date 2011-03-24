class Link < ActiveRecord::Base
  validate :label, :presence => true
  validate :url, :presence => true
  validate :link_type, :presence => true
  
  has_many :sub_navs, :class_name => "NavLink", :foreign_key => :parent_id
  belongs_to :top_nav, :class_name => "NavLink"
  
  scope :active, where(:active => true)
  scope :tops, where(:parent_id.blank?)
  scope :nav, where(:link_type => 'navigation')
  scope :social, where(:link_type => 'social')
  default_scope order("parent_id, position")
  
  def to_s
    is_symbol? ? t(label.to_sym) : label
  end
end
