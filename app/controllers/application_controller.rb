class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  before_filter :nav_links
  before_filter :socnet_links
  
  def nav_links
		@nav_links = Link.nav.active.tops
  end
  
  def socnet_links
    @socnet_links = Link.social.active
  end
end
