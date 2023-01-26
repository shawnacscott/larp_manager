class CharactersController < ApplicationController
  before_action :set_character, only: %i[show edit update destroy]

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to @character, notice: "Character was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @character.update(character_params)
      redirect_to @character, notice: "Character was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @characters = Character.all
  end

  def show
    @attributes = @character.attributes
  end

  def destroy
    @character.destroy
    redirect_to characters_url, notice: "Character was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character
    @character = Character.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def character_params
    params.require(:character).permit(:name, :profile_id)
  end
end
