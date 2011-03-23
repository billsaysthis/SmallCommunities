class Setting < ActiveRecord::Base
  validates :name, :presence => true #, :unique => true
  validates :value, :presence => true
  
  def self.retrieve key, as_type='string'
    val = Setting.where(:name => key).first.value
    if as_type == 'int'
      val.to_i
    else
      val
    end
  end
end