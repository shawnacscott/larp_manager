class DashboardController < ApplicationController
  def show
    @events = policy_scope(Event)
    @characters = policy_scope(Character).where(user: current_user)

    authorize :dashboard, :show?
  end
end
