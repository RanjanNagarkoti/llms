class ParticipantsController < ApplicationController
  before_action :set_event, only: %i[create destroy set_participant new]
  before_action :set_participant, only: %i[destroy]

  def new
    @participant = @event.participants.new
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def create
    if admin_creating_participant?
      @participant = @event.participants.build(participant_params.merge(presenter: true))

      if @participant.save
        EventMailer.notify_presenter(@participant, @event).deliver_later
        respond_to do |format|
          format.html { redirect_to event_path(@event), notice: 'Record successfully created.' }
          format.turbo_stream { flash.now[:notice] = 'Presenter successfully added.' }
        end
      else
        render :new, status: :unprocessable_entity
      end
    else
      @participant = Participant.create(user_id: current_user.id, event_id: @event.id)
      return unless @participant.save

      redirect_to user_event_path(@event), notice: 'Record successfully created.'
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

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

  def admin_creating_participant?
    # Check if the current user is an admin and if participant_params includes :user_id
    current_user.admin? && participant_params.key?(:user_id)
  end

  def participant_params
    params.require(:participant).permit(:user_id)
  end
end
