class EventsController < ApplicationController
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
  
  protected
  def setup
    @event = params[:id].blank? ? Event.current_event : Event.find(params[:id])
    @event ||= Event.tba
    @is_current = @event.is_current?
    @context_title = @event.title
    @show_rsvp = current_user && current_user.attendances.where(:event_id => @event.id).size == 0
    # @event_template = @event.is_special ? 'events/' + @event.special_layout_name : 'event'
    @event_template = 'event'
    @show_sponsors = @event.show_sponsors
  end

end
