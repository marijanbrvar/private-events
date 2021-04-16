module ApplicationHelper
  def current_user?
    session[:current_user] = User.find(id)
    session[:current_user]
  end
end
