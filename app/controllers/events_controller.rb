class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy edit_material update_material]
  before_action :is_presenter, only: %i[edit_material update_material]

  def index
    @pagy, @events = pagy(Event.all.order(created_at: :desc))
  end

  def show; end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)

    if @event.save
      respond_to do |format|
        format.html { redirect_to events_path, notice: 'Record successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: 'Record updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Record deleted successfully.'
  end

  def edit_material
    render :edit_material
  end

  def update_material
    respond_to do |format|
      if @event.update(event_params)
        redirect_to user_event_path(@event), notice: 'Record updated successfully.'
        format.turbo_stream
      else
        render :edit_material, status: :unprocessable_entity
      end
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :date, :time, :duration, :status, :visibility, :location,
                                  :type_id, :cover_picture, :content, materials: [])
  end

  def is_presenter
    redirect_to root_path unless current_user.presenter?
  end
end
