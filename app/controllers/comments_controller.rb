class CommentsController < ApplicationController
  before_action :set_event, only: %i[create new]

  def new
    @comment = @event.comments.new
  end

  def create
    @comment = @event.comments.build(comment_params.merge(user_id: current_user.id))

    if @comment.save
      respond_to do |format|
        format.html { redirect_to user_event_path(@event), notice: 'Record successfully created.' }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
