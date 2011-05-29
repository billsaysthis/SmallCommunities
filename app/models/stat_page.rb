class StatPage < ActiveRecord::Base
  validates :title, :presence => true, :uniqueness => true
  # must have at least ONE content block
  validates :content1, :presence => true
  
  scope :active, where(:active => true)
  default_scope order("title")
  
  # def valid_building_blocks
  #   if content1.include? "{{"
  #     if content1.include? "}}"
  #       st = content1.index("{{") + 2
  #       en = content1.index("}}") - 2
  #       bblock = content1[st,en].split(",")
  #       blockname = BuildingBlock.where(:group => "building block",:value => bblock[0]).first
  #       if blockname.present?
  #       else
  #         errors.add(:content1, "Building Block name is not valid")
  #       end
  #     else
  #       raise "Cannot have open curly braces without closing pair as well"
  #     end
  #   end
  # end
end
