class UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy]
  def index
    @pagy, @users = pagy(User.where.not(role: 2))
  end

  def show; end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
