class ParticipantsController < ApplicationController
  before_action :set_event, only: %i[create destroy set_participant]
  before_action :set_participant, only: %i[destroy]

  def create
    @participant = Participant.create(user_id: current_user.id, event_id: @event.id)
    return unless @participant.save

    respond_to do |format|
      format.html { redirect_to user_event_path(@event), notice: 'Record successfully created.' }
      format.turbo_stream
    end
  end

  def destroy
    @participant = Participant.find_by(user_id: current_user.id, event_id: @event.id)
    if @participant
      @participant.destroy
      respond_to do |format|
        format.html { redirect_to user_event_path(@event), notice: 'Record successfully destroyed.' }
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.html { redirect_to user_event_path(@event), alert: 'Record not found.' }
        format.turbo_stream
      end
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
