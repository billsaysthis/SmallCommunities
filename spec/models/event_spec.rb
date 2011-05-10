require 'spec_helper'

describe Event do
  before :all do
    Setting.create({:name => "default_next_event_date", :value => 'w:2,d:tuesday'})
    Setting.create({:name => "earliest_valid_year", :value => '2006'})
    Setting.create({:name => "default_event_description", :value => 'test description'})
    Setting.create({:name => "default_event_title", :value => 'test title'})
  end
  
  it "should not be valid without a title" do
    evt = Factory.build(:event, :title => nil)
    evt.should_not be_valid
  end
  
  it "should not be valid without an occurs_on" do
    evt = Factory.build(:event, :occurs_on => nil)
    evt.should_not be_valid
  end
  
  it "should not be valid without a status" do
    evt = Factory.build(:event, :status => nil)
    evt.should_not be_valid
  end

  it "should not be valid without a page_template" do
    evt = Factory.build(:event, :page_template => nil)
    evt.should_not be_valid
  end
  
  it "should build a next scheduled event if none is in the db" do
    evt = Event.tba
    evt.should be_valid
  end

  it "should build a next scheduled event according to default event date setting if none is in the db" do
    evt = Event.tba
    evt.should be_valid
  end
end