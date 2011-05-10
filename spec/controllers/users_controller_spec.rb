require 'spec_helper'

describe UsersController do
  before :all do
    Setting.create({:name => "earliest_valid_year", :value => '2006'})
  end
  
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      usr = Factory(:user)
      get 'edit', :id => usr.id
      response.should be_success
    end
  end

  # describe "GET 'update'" do
  #   it "should be successful" do
  #     get 'update'
  #     response.should be_success
  #   end
  # end

  describe "GET 'show'" do
    it "should be successful" do
      usr = Factory(:user)
      get 'show', :id => usr.id
      response.should be_success
    end
  end

end
