class TypesController < ApplicationController
  before_action :set_type, only: %i[show edit update destroy]

  def index
    @pagy, @types = pagy(Type.all.order(created_at: :desc))
  end

  def show; end

  def new
    @type = Type.new
  end

  def create
    @type = Type.create(type_params)

    if @type.save
      respond_to do |format|
        format.html { redirect_to types_path, notice: 'Record successfully created.' }
        format.turbo_stream { flash.now[:notice] = 'Record successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @type.update(type_params)
        redirect_to types_path, notice: 'Record updated successfully.'
        format.turbo_stream { flash.now[:notice] = 'Record updated successfully.' }
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @type.destroy

    respond_to do |format|
      format.html { redirect_to types_path, notice: 'Record deleted successfully.' }
      format.turbo_stream { flash.now[:notice] = 'Record deleted successfully.' }
    end
  end

  private

  def set_type
    @type = Type.find(params[:id])
  end

  def type_params
    params.require(:type).permit(:name)
  end
end
