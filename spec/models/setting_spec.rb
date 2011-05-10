require 'spec_helper'

describe Setting do
  it "should not be valid without a  name" do
    stg = Factory.build(:setting, :name => nil)
    stg.should_not be_valid
  end
  
  it "should not be valid without a value" do
    stg = Factory.build(:setting, :value => nil)
    stg.should_not be_valid
  end

end