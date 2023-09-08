class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def index
    @pagy, @events = pagy(Event.all.order(created_at: :asc))
  end

  def show; end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
