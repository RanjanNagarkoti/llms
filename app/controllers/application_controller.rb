class ApplicationController < ActionController::Base
  layout :set_layout
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username first_name last_name avatar])
  end

  private

  def set_layout
    if current_user&.admin?
      'admin'
    elsif current_user&.user? || current_user&.presenter?
      'application'
    end
  end
end
