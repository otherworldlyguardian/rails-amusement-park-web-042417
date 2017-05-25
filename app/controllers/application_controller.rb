class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?
  helper_method :admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin?
    current_user.admin
  end

  def logged_in?
    !!current_user
  end

  def authenticate
    unless logged_in?
      flash[:error] = "You must be logged in to access this section of the site"
      redirect_to root_path
    end
  end

end
