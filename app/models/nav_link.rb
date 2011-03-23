class NavLink < ActiveRecord::Base
  validate :label, :presence => true
  validate :url, :presence => true
  
  has_many :sub_navs, :class_name => "NavLink", :foreign_key => :parent_id
  belongs_to :top_nav, :class_name => "NavLink"
  
  def to_s
    is_symbol? ? t(label.to_sym) : label
  end
end
