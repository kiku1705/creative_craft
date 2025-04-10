class RoleRouteConstraint
  def initialize(&block)
    @block = block
  end

  def matches?(request)
    user = current_user(request)
    debugger
    user.present? && @block.call(user)
  end

  def current_user(request)
    User.find_by_id(request.session[:user_id])
  end
end