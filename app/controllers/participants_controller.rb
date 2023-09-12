class ParticipantsController < ApplicationController
  before_action :set_event, only: %i[create destroy set_participant]
  before_action :set_participant, only: %i[destroy]

  def create
    @participant = Participant.create(user_id: current_user.id, event_id: @event.id)
    return unless @participant.save

    redirect_to user_event_path(@event), notice: 'Record successfully created.'
  end

  def destroy
    @participant = Participant.find_by(user_id: current_user.id, event_id: @event.id)
    if @participant
      @participant.destroy
      redirect_to user_event_path(@event), notice: 'Record successfully destroyed.'
    else
      redirect_to user_event_path(@event), alert: 'Record not found.'
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_participant
    @participant = Participant.find_by(user_id: current_user.id, event_id: @event.id)
  end
end
