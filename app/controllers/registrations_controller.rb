class RegistrationsController < Devise::RegistrationsController
  def create
    if recaptcha_valid?
      super
    else
      build_resource
      clean_up_passwords(resource)
      flash[:alert] = t(:recaptcha_error)
      render_with_scope :new
    end
  end
end
