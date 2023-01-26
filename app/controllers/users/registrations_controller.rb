# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  after_action :create_default_profile, only: :create

  private

  def create_default_profile
    SetupNewAccount.call(user_id: @user.id)
  end
end
