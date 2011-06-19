class Paypal < ActiveRecord::Base
  BUTTON_TYPES = %w(special regular)
  has_and_belongs_to_many :events

  scope :regulars, where(:button_type => 'regular')
  scope :specials, where(:button_type => 'special')
  
  validates :name, :presence => true
  validates :guid, :presence => true
  validates :button_type, :presence => true, :inclusion => {:in => BUTTON_TYPES}
  validates :amount, :presence => true
  
  def button_type_enum
    BUTTON_TYPES
  end
end
