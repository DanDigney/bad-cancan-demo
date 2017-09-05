module ApplicationHelper
  def logged_in?
    session[:id] != nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:id]) if logged_in?
  end
end
