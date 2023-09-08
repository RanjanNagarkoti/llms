class EventsController < ApplicationController
  before_action :set_event, only: [:show]

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

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :date, :time, :duration, :status, :visibility, :location,
                                  :type_id, :cover_picture, :content)
  end
end
