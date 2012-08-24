class NominationsController < ApplicationController
  before_filter :load_resources

  def create
    unless @hackathon.is_judge?(current_user) || @hackathon.is_admin?(current_user)
      render :text => 'only judges can nominate'
    else
      @project.nominate!(params[:award_name], current_user)

      render :partial => "hackathons/project_nominations_mine", :locals => {:project => @project}
    end
  end

  def destroy
    unless @hackathon.is_judge?(current_user) || @hackathon.is_admin?(current_user)
      render :text => 'only judges can delete nominations'
    else
      @project.nominations.delete_if{|n| n.id.to_s == params[:id].to_s}
      @project.save!
      render :partial => "hackathons/project_nominations_mine", :locals => {:project => @project}
    end
  end

  def update
  end

  private
  def load_resources
    @project ||= Project.find(params['project_id'])
    @hackathon ||= @project.hackathon
  end
end