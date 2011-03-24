class EventsController < ApplicationController
  before_filter :authenticate_user!, :only => [:rsvp]
  before_filter :setup, :only => [:index, :show]
  
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
    @is_current = @event.is_current?
    @context_title = @event.title
    @show_rsvp = current_user && current_user.attendances.where(:event_id => @event.id).size == 0
    # @event_template = @event.is_special ? 'events/' + @event.special_layout_name : 'event'
    @event_template = 'event'
    @sponsors = User.active_sponsors if @event.show_sponsors
  end

end
