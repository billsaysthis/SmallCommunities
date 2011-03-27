class EventsController < ApplicationController
  before_filter :authenticate_user!, :only => [:rsvp]
  before_filter :setup, :only => [:index, :show]
  before_filter :app_setup
  
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
    @context_title = @event.title
    @show_rsvp = current_user && current_user.attendances.where(:event_id => @event.id).blank?
    @sponsors = User.current_sponsors if @event.show_sponsors
  end

  def app_setup
    @socnet_links = Linkage.social.active
  end
end
