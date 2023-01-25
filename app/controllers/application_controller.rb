class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!
  # TODO: Enable fail-closed authorization
  # after_action :verify_authorized, except: :index
  # after_action :verify_policy_scoped, only: :index

  def active_profile
    current_user.active_profile
  end

  def pundit_user
    active_profile
  end
end
