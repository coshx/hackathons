class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:create, :destroy, :failure]

  def create
    auth = request.env['omniauth.auth']
    user = User.find_or_create_with_omniauth(auth)

    session[:user_id] = user.id
    if user.hackathons.count > 0
      redirect_to user.hackathons.first, :notice => "You are now signed in!"
    else
      redirect_to hackathons_url, :notice => "You are now signed in!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You are now logged out!"
  end

  def failure
    msg = params[:message]
    strategy = params[:strategy]

    redirect_to root_url, :alert => "Unable to login with #{strategy}: #{msg}"
  end
end
