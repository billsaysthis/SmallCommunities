require 'spec_helper'

describe User do
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  it "should not be valid without a first name" do
    usr = Factory.build(:user, :first_name => nil)
    usr.should_not be_valid
  end
  
  it "should not be valid without a last name" do
    usr = Factory.build(:user, :last_name => nil)
    usr.should_not be_valid
  end
  
  it "should not be valid without an email address" do
    usr = Factory.build(:user, :email => nil)
    usr.should_not be_valid
  end
  
  it "should not be valid without a unique email address" do
    usr1 = Factory(:user, :email => 'qw@example.com')
    usr2 = Factory.build(:user, :email => 'qw@example.com')
    usr2.should_not be_valid
  end
  
  it "should not be valid without a valid email address" do
    usr = Factory.build(:user, :email => 'qwqwqw')
    usr.should_not be_valid
  end
  
  it "should not be valid with an invalid URL" do
    usr = Factory.build(:user, :url => 'qwqwqwqw')
    usr.should_not be_valid
  end
  
  it "should have at least one membership" do
    usr = Factory(:user)
    usr.memberships.should be_present
  end
end
