class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :nav_links
  
  def nav_links
		@nav_links = [
		  [:memberships_link, memberships_url],
  		[:about_link, about_url], 
  		[:past_events_link, events_past_url], 
  		[:members_link, member_pages_url],
  		[Setting.retrieve('current_year')+' Schedule', events_upcoming_url]
  	]
  end
end
