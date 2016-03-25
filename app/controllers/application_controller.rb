class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in? # Check if the current_user is logged in.
  
  def current_user # Check the current user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in? # Checks if the user is logged in
    !!current_user
  end
  
  def require_user # Require a user to be logged in in order to perform certain actions
    if !logged_in?
      
      redirect_to root_path, notice: "You must be logged in to perform that action"
    end
  end
  
  def already_signed_in # Used to restrict users from accessing Signup and Login pages.
    if logged_in? 
      redirect_to root_path, notice: "Acting Smart eh? yer already logged in "
    end
  end
end
