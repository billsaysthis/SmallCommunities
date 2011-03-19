module EventsHelper
  def location_label event
    if event.location.blank?
      l_url = Setting.retrieve 'default_location_url'
      l_label = Setting.retrieve 'default_location_label'
      link_to l_label, l_url
    else
      event.location
    end
  end
  
  def event_pricing event
    if event.special_pricing.present?
      t(:special_pricing) + event.special_pricing
    else
			t(:advance_pricing) + Setting.retrieve('regular_event_advance') + "<br/>" + t(:door_pricing) + Setting.retrieve('regular_event_door')
    end
  end
  
  def speaker_list(speakers, needs_with=true)
    spkrs = []
    speakers.each do |speaker|
      if speaker.url == ''
        spkrs << speaker.name
      else
		    spkrs << link_to(speaker.name, speaker.url)
	    end
	  end
	  wth = speakers.size > 0 ? needs_with ? t(:with) + ' ' : t(:with) + ' ' : ''
	  raw(wth + spkrs.to_sentence)
  end
  
  def show_year(curyear, evt_year)
    curyear != evt_year ? content_tag(:div, content_tag(:div, curyear), :class => 'curyear') : ''
  end
  
  def short_desc_link(event)
    spkrs = speaker_list(event[:speakers], false) unless event[:speakers] == ''
    link_to(event[:title], event[:url]) + ' ' + spkrs
  end
end