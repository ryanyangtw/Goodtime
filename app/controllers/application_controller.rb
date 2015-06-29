class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_user
    redirect_to new_user_session_path unless current_user
  end



  helper_method :current_user

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
