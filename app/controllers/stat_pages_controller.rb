class StatPagesController < ApplicationController
  before_filter :setup, :except => [:show]
  
  def index
    redirect_to :about
  end
  
  def show
    if params[:id].present
      @page = StatPage.find params[:id]
      if @page.present? and @page.active
        @context_title = @page.title
        @sponsors = User.active_sponsors if @page.show_sponsors
      else
          redirect_to :index
        end
    else
      redirect_to :index
    end
  end
  
  def contact
    @event = Event.current_event
    @context_title = t(:contact_link)
    @mailing_list_url = Setting.retrieve('mailing_list_url')
    
    unless params[:yourname].blank? && params[:youremail].blank? && params[:yourmessage].blank?
      if params[:yourname].blank?
        errors.add(:missing_name)
      end
      if params[:youremail].blank?
        errors.add(t(:missing_email))
      end
      if params[:yourmessage].blank?
        errors.add(t(:missing_message))
      end
      if errors.present?
        if ContactMailer.contact_email(params)
          flash.now[:notice] = t(:contact_success)
        else
          flash.now[:alert] << t(:contact_failure)
        end
        redirect_to root_url
      else
        flash.now[:alert] << t(:contact_failure)
      end
    end
  end
  
  def about
    @page = StatPage.where(:title => 'About')
    @context_title = t(:about_link)
  end
  
  def memberships
    @page = StatPage.where(:title => 'Membership')
    @context_title = t(:memberships_link)
  end
  
  protected
  def setup
    @sponsors = User.active_sponsors
  end
end
