class HomeController < ApplicationController
  skip_before_filter :require_login, :only => :index
  
  def index
    if current_user
      if current_user.hackathons.count > 0
        redirect_to current_user.hackathons.first
      else
        redirect_to :controller => 'hackathons', :action => 'index'
      end
    end
  end
end