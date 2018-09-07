class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_admin
    alert_text = 'You must be an administrator to perform this action.'
    redirect_to '/', alert: alert_text unless current_user && admin_allowed
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
  end

  def admin_allowed
    current_user.try(:admin?)
  end
end
