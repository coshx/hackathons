class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login

  helper_method :current_user

  private

  def require_login
    unless current_user
      flash[:error] = "Sorry, you must be logged in to use this site"
      redirect_to root_url
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
