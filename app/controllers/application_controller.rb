class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def active_profile
    current_user.active_profile
  end
end
