class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  before_filter :nav_links
  before_filter :socnet_links
  
  def nav_links
		@nav_links = Linkage.nav.active.tops
  end
  
  def socnet_links
    @socnet_links = Linkage.social.active
  end
end
