module ApplicationHelper
  include Compass::SassExtensions::Functions::ImageSize
  include Rack::Recaptcha::Helpers
  
  def page_title(context_title='')
    Setting.retrieve('long_name') + (context_title.blank? ? '' :  ' - ' + context_title)
  end

  def context_title
    ct = @context_title || ''
    (ct != "") ? ' - ' + ct : ''
  end
  
  def signin_link
    if user_signed_in?
      link_to(t(:sign_out), destroy_user_session_path) + " " + link_to(t(:profile_link), edit_user_path(current_user))
    else
      link_to t(:sign_in), new_user_session_path
    end
  end
  
  def member_image_link(user)
    return if user.logo.blank?
    
    ih = image_height(Sass::Script::String.new(user.m_logo))
    ic = (ih.to_i > 115) ? 'logoHT' : 'logoWD'

    link_to image_tag(user.m_logo, :alt => user.name), user.url, :class => ic
  end

  def add_to_cal_link id
    id.present? ? link_to(t(:add_to_calendar), calendar_event_url(@event.id, :format => :ics), :class => 'calLink') : ""
  end
  
  def nav_link link, url
    lbl = (link.class == String) ? link : t(link)
    content_tag :li, link_to(lbl, url), :id => lbl.dasherize
  end
  
  def logo_image img, alt=""
    image_tag('logos/'+img, :id => 'logoimg', :alt => alt)
  end

  def special_event_date(event)
    event.occurs_on.wday != 2 ?  content_tag(:div, t(:special_date_notice), :class => 'is-special') : ''
  end
end
