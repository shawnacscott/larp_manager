class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :verify_authorized, except: :index, unless: :uncustomized_devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: new_user_session_path)
  end

  def uncustomized_devise_controller?
    devise_controller? && self.class != Users::RegistrationsController
  end

  def configure_permitted_parameters
    return if current_user.nil?
    devise_parameter_sanitizer.permit(:sign_up, keys: policy(current_user).permitted_attributes)
  end
end
