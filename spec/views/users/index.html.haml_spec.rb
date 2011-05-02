require 'spec_helper'

describe "users/index.html.haml" do
  
  before(:each) do
    Factory(:user)
    @users = User.visible.active
  end
  
  it "should have an id of user_id number for each row" do
    render
    rendered.should =~ Regexp.new('user_'+@users.first.id.to_s)
  end
  
  it "should have a twitter link for a social user" do
    @user = Factory(:social_user)
    
    render
    rendered.should =~ Regexp.new(@user.twitter)
  end
  
  it "should not have a twitter link for a user without a twitter url" do
    @user = User.first
    
    render
    rendered.should_not =~ Regexp.new("user-twitter-link")
  end
end
