class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  before_filter :set_menu, :social_links

  def set_menu
		nav_links = Linkage.nav.active.tops
    @menu = Mmmenu.new(:request => request) do |l1|
      nav_links.each do |nav|
        if nav.sub_navs.present?
          l1.add(show_label(nav), nav.url) do |l2|
            nav.sub_navs.each do |sn|
              l2.add show_label(sn), sn.url
            end
          end
        else
          l1.add(show_label(nav), nav.url)
        end
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
