class HomeController < ApplicationController
  skip_before_filter :require_login, :only => :index
  
  def index
    if current_user
      redirect_to :controller => 'hackathons', :action => 'index'
    end
  end
end