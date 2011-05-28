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
    if @events.blank?
      flash.notice = "There are no upcoming events scheduled"
      redirect_to :back
    end
  end

  def show
  end

  def soldout
    @event = Event.find(params[:id])
    @event.change_status("sold_out") if @event.active?
    redirect_to event_path(@event)
  end
  
  def at_door
    @event = Event.find(params[:id])
    @event.change_status("at_door") if @event.active?
    redirect_to event_path(@event)
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
  
  # TODO make into an AJAX call
  def rsvp
    if params[:id].present?
      evt = Event.find(params[:id])
      Rsvp.create!({:event => evt, :user => current_user})
      render :update do |page|
        page.replace 'memberRSVP', t(:thanks_for_rsvp)
      end
    end
  end
  
  protected
  def setup
    @event = params[:id].blank? ? Event.current_event : Event.find(params[:id])
    # if no specific event requested and no next event in dba,
    # fabricate one for this request
    @event ||= Event.tba
    # checks if Event should be moved to 'past' status
    @event.check_status
    @context_title = @event.title
    @show_rsvp = user_signed_in? and current_user.rsvps.present? and current_user.rsvps.where(:event_id => @event.id).blank?
    @sponsors = User.current_sponsors if @event.show_sponsors
  end
end
