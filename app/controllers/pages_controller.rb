class PagesController < InheritedResources::Base
  respond_to :html
  
  def contact
    @event = Event.current_event
    @context_title = t(:contact_link)
    
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
    @context_title = t(:about_link)
  end
  
  def member_pages
    @context_title = t(:members_link)
    @members = Member.active_public
  end

  def memberships
    @context_title = t(:memberships_link)
  end
  
  protected
  def setup
    @show_sponsors = true
  end
end
