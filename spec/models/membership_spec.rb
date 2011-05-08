require 'spec_helper'

describe Membership do
  before :all do
    Setting.create({:name => 'earliest_valid_year', :value => '2006'})
  end
  
  it "should not be valid without a year" do
    ms = Factory.build(:membership, :year => nil)
    ms.should_not be_valid
  end

  it "should not be valid without a valid year" do
    too_early = 1995 #Setting.find_by_name("earliest_valid_year").value.to_i - 10
    ms = Factory.build(:membership, :year => too_early.to_s)
    ms.should_not be_valid
  end

  it "should not be valid without a membership type" do
    ms = Factory.build(:membership, :mtype => nil)
    ms.should_not be_valid
  end

  it "should not be valid without a valid membership type" do
    ms = Factory.build(:membership, :mtype => '1111111')
    ms.should_not be_valid
  end

  it "should be valid with a valid membership type" do
    ms = Factory.build(:membership, :mtype => configatron.memberships.first)
    ms.should be_valid
  end
end
