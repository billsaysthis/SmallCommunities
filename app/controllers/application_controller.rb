class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  before_filter :nav_links
  before_filter :socnet_links
  
  def nav_links
		@nav_links = [
		  {:top => [:memberships_link, memberships_url]},
  		{:top => [:about_link, about_url]}, 
  		{:top => [:past_events_link, past_events_url]}, 
  		{:top => [:members_link, users_url]},
  		{:top => [Setting.retrieve('current_year')+' Schedule', upcoming_events_url]}
  	]
  end
  
  def socnet_links
    @socnet_links = [
  		{:id => 'facebook', :label => ' Facebook', :url => "http://www.facebook.com/group.php?gid=5783743884"},
  		{:id => 'yahoo', :label => ' Yahoo! Groups ', :url => "http://groups.yahoo.com/group/JHTCmembers"},
  		{:id => 'twitter', :label => ' Twitter', :url => "http://www.twitter.com/JHTCsv"},
  		{:id => 'linkedin', :label => ' LinkedIn', :url => "http://www.linkedin.com/groups?gid=110955"}
    ]
  end
end
