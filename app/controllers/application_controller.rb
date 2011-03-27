class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  before_filter :set_menu

  def set_menu
		nav_links = Linkage.nav.active.tops
    @menu = Mmmenu.new(:request => request) do |l1|
      nav_links.each do |nav|
        if nav.sub_navs.present?
          l1.add(nav.label, nav.url) do |l2|
            nav.sub_navs.each do |sn|
              l2.add sn.label, sn.url
            end
          end
        else
          l1.add(nav.label, nav.url)
        end
      end
    end
  end
end
