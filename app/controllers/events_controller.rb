class EventsController < ApplicationController
  def index
    @pagy, @events = pagy(Event.all.order(created_at: :asc))
  end
end
