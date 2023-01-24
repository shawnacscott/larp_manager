class CharactersController < ApplicationController
  before_action :set_character, only: %i[ show edit update destroy ]
  before_action :set_users, only: %i[ new edit ]

  def new
    @character = Character.new

    authorize @character
  end

  def create
    @character = Character.new(permitted_attributes(Character))

    if !current_user.is_national_staff_or_greater?
      @character.user_id = current_user.id
    end

    authorize @character

    if @character.save
      redirect_to @character, notice: "Character was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @character.update(permitted_attributes(Character))
      redirect_to @character, notice: "Character was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @characters = policy_scope(Character)
  end

  def show; end

  def destroy
    @character.destroy
    redirect_to characters_url, notice: "Character was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character
    @character = authorize Character.find(params[:id])
  end

  def set_users
    @users = policy_scope(User).pluck(:email, :id)
  end
end
