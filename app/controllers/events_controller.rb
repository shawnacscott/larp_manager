class EventsController < ApplicationController
  # Skip Devise authentication (i.e. do not require a user to be
  # signed in) for the event index and show pages
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_chapters, only: [:new, :edit]

  # GET /events
  def index
    @events = policy_scope(Event)
  end

  # GET /events/1
  def show; end

  # GET /events/new
  def new
    @event = Event.new

    authorize @event
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  def create
    @event = Event.new(permitted_attributes(Event))

    authorize @event

    if @event.save
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(permitted_attributes(@event))
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to events_url, notice: "Event was successfully destroyed."
  end

  private

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def set_chapters
    @chapters = policy_scope(current_user.all_chapter_role_chapters).pluck(:name, :id)
  end
end
