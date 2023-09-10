class PagesController < ApplicationController
  def index
    if current_user.admin?
      redirect_to root_path # Redirect admins to their dashboard
    else
      redirect_to user_home_path # Redirect regular users to their dashboard
    end
  end

  def event
    @upcomings = Event.where(visibility: 'event_public', status: 'upcoming')
                      .where('date >= ?', Date.today)
                      .where('time > ?', Time.now)
                      .order(date: :asc, time: :asc)
                      .limit(2)

    @pagy, @events = pagy(Event.where(visibility: 'event_public'))

    @types = Type
             .joins(:events)
             .group('types.id, types.name')
             .order('COUNT(events.type_id) DESC')
             .limit(5)
  end

  def show
    @event = Event.find_by(id: params[:id], visibility: 'event_public')
    @comments = @event.comments.where(parent_id: nil)
  end
end
