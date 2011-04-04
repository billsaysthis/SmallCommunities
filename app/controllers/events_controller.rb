class EventsController < ApplicationController
  before_filter :authenticate_user!, :only => [:rsvp]
  before_filter :setup, :only => [:index, :show, :calendar]
  
  def index
  end

  def past
    @events = Event.past_events
  end

  def upcoming
    @events = Event.current_year
  end

  def show
  end

  def calendar
    respond_to do |format|
      format.ics {
        calendar = Icalendar::Calendar.new
        calendar.custom_property("X-WR-CALNAME;VALUE=TEXT", Setting.retrieve("short_name")+@event.occurs_on.to_s(:month_year))
        calendar.add_event(@event.to_ics)
        calendar.publish
        send_data(calendar.to_ical, :type => 'text/calendar', :filename => 'sc_cal_' + params[:id])
      }
    end
  end
  
  def rsvp
    if params[:id].present?
      evt = Event.find(params[:id])
      Attendance.create!({:event => evt, :user => current_user})
      render :update do |page|
        page.replace 'memberRSVP', t(:thanks_for_rsvp)
      end
    end
  end
  
  protected
  def setup
    @event = params[:id].blank? ? Event.current_event : Event.find(params[:id])
    @event ||= Event.tba
    @context_title = @event.title
    @show_rsvp = user_signed_in? and current_user.attendances.present? and current_user.attendances.where(:event_id => @event.id).blank?
    @sponsors = User.current_sponsors if @event.show_sponsors
  end
end
