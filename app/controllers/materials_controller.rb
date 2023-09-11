# frozen_string_literal: true

class MaterialsController < ApplicationController
  before_action :set_event, only: %i[new create]

  def new
    @material = @event.materials.build
  end

  def create
    @material = @event.materials.build(material_params)

    if @material.save
      respond_to do |format|
        format.html { redirect_to user_event_path(@event), notice: 'Record successfully created.' }
        format.turbo_stream { flash.now[:notice] = 'Record successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def material_params
    params.require(:material).permit(:files)
  end
end
