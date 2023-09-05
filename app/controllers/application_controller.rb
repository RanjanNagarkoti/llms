class ApplicationController < ActionController::Base
  layout :set_layout

  private

  def set_layout
    if current_user&.admin?
      'admin'
    elsif current_user&.user? || current_user&.presenter?
      'application'
    end
  end
end
