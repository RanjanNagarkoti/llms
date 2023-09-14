class CommentsController < ApplicationController
  before_action :set_event, only: %i[create new destroy edit update]
  before_action :set_comment, only: %i[destroy edit update]

  def new
    @comment = @event.comments.new
  end

  def create
    @comment = @event.comments.build(comment_params.merge(user_id: current_user.id))
    if @comment.save

      respond_to do |format|
        @current_user = current_user
        
        format.html { redirect_to user_event_path(@event), notice: 'Record successfully created.' }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        @current_user = current_user

        redirect_to user_event_path(@event), notice: 'Record updated successfully.'
        format.turbo_stream
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @comment.destroy
    @current_user = current_user

    respond_to do |format|
      format.html { redirect_to user_event_path(@event), notice: 'Record deleted successfully.' }
      format.turbo_stream
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
