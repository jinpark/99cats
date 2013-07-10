class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token]) if session[:session_token]
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user
    raise ActionController::RoutingError.new('Not Found') unless logged_in?
  end

end