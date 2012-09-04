class NominationsController < ApplicationController
  before_filter :load_resources, :except => :index

  def index
    @hackathon = Hackathon.find(params['hackathon_id'])

    # key by award_id
    nominations = {}

    # TODO: move this logic into a Presenter?

    if @hackathon.judging_ends_at < Time.current
      # judging is over, show everyone's votes
      @hackathon.projects.each do |project|
        project.nominations.each do |nomination|
          nominations[nomination.award_id] ||= []
          nominations[nomination.award_id] << project.name
        end
      end
    else
      @hackathon.projects.each do |project|
        project.nominations.each do |nomination|
          if nomination.judge_id == current_user.id
            nominations[nomination.award_id] ||= []
            nominations[nomination.award_id] << project.name
          end
        end
      end
    end

    render :json => nominations
  end

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