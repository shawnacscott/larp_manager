class ChaptersController < ApplicationController
  before_action :set_chapter, only: %i[show edit update destroy]

  # GET /chapters
  def index
    @chapters = Chapter.all
  end

  # GET /chapters/1
  def show
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
  end

  # GET /chapters/1/edit
  def edit
  end

  # POST /chapters
  def create
    @chapter = Chapter.new(chapter_params)

    if @chapter.save
      redirect_to @chapter, notice: "Chapter was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chapters/1
  def update
    if @chapter.update(chapter_params)
      redirect_to @chapter, notice: "Chapter was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /chapters/1
  def destroy
    @chapter.destroy
    redirect_to chapters_url, notice: "Chapter was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def chapter_params
    params.require(:chapter).permit(:name)
  end
end
