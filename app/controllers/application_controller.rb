class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user_now
    User.find(session[:current_user]['id'])
  end
end
