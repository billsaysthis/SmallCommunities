require 'spec_helper'

describe EventsController do
  before :all do
    Setting.create({:name => "default_next_event_date", :value => 'w:2,d:tuesday'})
  end
  
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'past'" do
    it "should be successful" do
      get 'past'
      response.should be_success
    end
  end

  describe "GET 'upcoming'" do
    it "should be successful" do
      Factory.create(:event)
      Factory.create(:event, :title => "This is another Title", :occurs_on =>  Date.current + 2.months)
      @request.env['HTTP_REFERER'] = '/'
      get 'upcoming'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      evt = Factory(:event)
      get 'show', :id => evt.id
      response.should be_success
    end
  end

end
