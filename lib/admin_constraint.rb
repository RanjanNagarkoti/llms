class AdminConstraint
  def matches?(request)
    current_user = request.env['warden'].user
    current_user.present? && current_user.admin?
  end
end
