class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  before_filter :set_menu, :social_links

  def set_menu
		nav_links = Linkage.nav.active.tops
    @menu = []
    if user_signed_in? and current_user.admin?
      @menu << {:key => 'admin', :name => 'Admin', :url => '/admin', :class => 'special'}
    end
    nav_links.each do |nav|
      if nav.sub_navs.present?
        items = []
        nav.sub_navs.each do |sn|
          items << {:key => sn.url.sub(/\//, ''), :name => show_label(sn), :url => sn.url, :class => 'submenu'}
        end
        @menu << {:key => nav.url.sub(/\//, ''), :name => show_label(nav), :url => nav.url, :items => items}
      else
        @menu << {:key => nav.url.sub(/\//, ''), :name => show_label(nav), :url => nav.url}
      end
    end
  end

  def social_links
    @socnet_links = Linkage.social.active
  end
  
  private
  def show_label nav
    nav.is_symbol ? t(nav.label.to_sym) : nav.label
  end
end
