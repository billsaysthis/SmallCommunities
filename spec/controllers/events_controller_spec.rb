require 'spec_helper'

describe EventsController do

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
      get 'upcoming'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'setup'" do
    it "should be successful" do
      get 'setup'
      response.should be_success
    end
  end

end
