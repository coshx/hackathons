class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:create, :destroy]

  def create
    auth = request.env['omniauth.auth']
    user = User.find_or_create_with_omniauth(auth)

    session[:user_id] = user.id
    redirect_to hackathons_url, :notice => "You are now signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You are now logged out!"
  end

end
