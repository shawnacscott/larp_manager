class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]

  # GET /profiles
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  def show
    @profile = active_profile
    @events = Event.all
    @characters = @profile.characters
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to @profile, notice: "Profile was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profiles/1
  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: "Profile was successfully destroyed."
  end

  # PATCH/PUT /profiles/1/switch_to/2
  def switch_active_profile
    profile_to_inactivate = Profile.find_by(user: current_user, id: params[:old_id])
    profile_to_active     = Profile.find_by(user: current_user, id: params[:new_id])

    # TODO: Figure out how to catch and handle the errors this might raise
    ActiveRecord::Base.transaction do
      profile_to_inactivate.inactive!
      profile_to_active.active!
    end

    redirect_back(fallback_location: root_path)#, notice: "Profile was successfully updated."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = active_profile
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:profile).permit(
      :name,
      :for_acting_as,
      :status,
      :user_id
    )
  end

  def switch_params
    params.permit(
      :old_id,
      :new_id
    )
  end
end
