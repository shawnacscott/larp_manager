class CampaignsController < ApplicationController
  before_action :set_campaign, only: %i[ show edit update destroy ]
  before_action :set_chapters, only: %i[ new edit ]

  # GET /campaigns
  def index
    @campaigns = Campaign.all
  end

  # GET /campaigns/1
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  def create
    @campaign = Campaign.new(campaign_params)

    if @campaign.save
      redirect_to @campaign, notice: "Campaign was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /campaigns/1
  def update
    if @campaign.update(campaign_params)
      redirect_to @campaign, notice: "Campaign was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /campaigns/1
  def destroy
    @campaign.destroy
    redirect_to campaigns_url, notice: "Campaign was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def set_chapters
      @chapters = Chapter.select(:name, :id).all.collect { |c| [ c.name, c.id ] }
    end

    # Only allow a list of trusted parameters through.
    def campaign_params
      params.require(:campaign).permit(:name, :description, :chapter_id)
    end
end
