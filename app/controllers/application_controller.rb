class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end


  #   def require_login
  #     puts "User signed in? #{user_signed_in?}"
  #     return if user_signed_in?

  #     redirect_to new_user_session_path
  #   end
end
