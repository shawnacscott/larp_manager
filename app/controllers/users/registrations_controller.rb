# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # TODO: Decide is :cancel really shouldn't require authorization -- it probably needs it if we're going to let a superuser edit someone else's account
  after_action :verify_authorized, except: [ :new, :create, :cancel ]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    @user = if current_user.is_chapter_staff_or_greater?
      policy_scope(User).find(params[:id])
    else
      current_user
    end

    authorize @user, policy_class: UserPolicy

    super
  end

  # PUT /resource
  def update
    ####################
    # CUSTOMIZATIONS ADDED to original Devise controller code
    ####################
    require_current_password = true

    if current_user.is_chapter_staff_or_greater?
      self.resource = policy_scope(User).find(params.dig(:user, :id))
      require_current_password = false
    else
      self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    end

    authorize resource, policy_class: UserPolicy

    ####################
    # From this point on, original Devise controller text as of version 4.8.1
    # Original code that conflicts with customizations has been commented out
    ####################

    # self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    # Original
    # resource_updated = update_resource(resource, account_update_params)
    # Customized
    resource_updated = update_resource(resource, account_update_params, require_current_password)
    yield resource if block_given?
    if resource_updated
      set_flash_message_for_update(resource, prev_unconfirmed_email)
      #####
      # CUSTOMIZED
      if current_user.is_chapter_staff_or_greater? && resource != current_user
        redirect_to user_path(resource)
      else
        #####
        # ORIGINAL
        bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?
        respond_with resource, location: after_update_path_for(resource)
        # END ORIGINAL
        ######
      end
      # END CUSTOMIZED
      #####

    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # TODO
  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  protected

  def update_resource(resource, params, require_current_password)
    if require_current_password
      resource.update_with_password(params)
    else
      params.delete(:current_password)
      resource.update_without_password(params)
    end
  end
end
