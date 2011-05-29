class StatPage < ActiveRecord::Base
  validates :title, :presence => true, :uniqueness => true
  # must have some content!
  validates :content_block, :presence => true
  validate :valid_building_blocks
  
  scope :active, where(:active => true)
  default_scope order("title")
  
  def valid_building_blocks
    # In content field we may see strings of the following form
    # {{block name,param1,param2}}
    # This gets validated against an entry in the Lookup table
    # :group => "building_block"
    # :value => "block name"
    # :extras => "param type,param type,..."
    blocks = content_block.split("{{")
    # In this split, the first array item will not have a block in it
    # So remove first element before validating
    blocks.delete_at(0)
    if blocks.present?
      # this tests each block for when multiple blocks are present
      blocks.each {|cnt| valid_building_block(cnt)}
    end
  end
  
  def valid_building_block(content)
    if content.include? "}}"
      en = content.index("}}") - 1
      bblock = content[0,en].split(",")
      blockname = Lookup.where(:group => "building_block",:value => bblock[0]).first
      if blockname.present?
        param_spec = blockname.extras.split(",")
        if bblock.size == param_spec.size + 1
          bblock_counter = 1
          param_spec.each do |ps|
            unless bblock[bblock_counter].class.name.downcase == ps
              errors.add(:content_block, "Building Block parameter #{bblock_counter} is not the correct type")
              bblock_counter = bblock_counter + 1
            end
          end
        else
          errors.add(:content_block, "Building Block params are not valid: wrong number of params")
        end
      else
        errors.add(:content_block, "Building Block name is not valid")
      end
    else
      errors.add(:content_block, "Cannot have open curly braces without closing pair as well")
    end
  end
end
