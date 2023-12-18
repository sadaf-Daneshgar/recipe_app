class ApplicationController < ActionController::Base
  before_action :require_login, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

  def require_login
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
