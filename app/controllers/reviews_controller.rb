class ReviewsController < ApplicationController
  before_filter :load_resources

  def create
    @review ||= Review.new
    @review.update_attributes(params['review'])
    @review.judge_id ||= current_user.id
    @project.reviews << @review
    @project.save!

    flash[:notice] = "Successfully created review for #{@project.name}!"

    redirect_to @hackathon
  end

  def update
    if current_user.id != @review.judge_id
      flash[:error] = 'Sorry, you cannot edit other judges\' reviews'
    else
      @review.update_attributes(params['review'])
      @project.reviews << @review
      @project.save!
      flash[:notice] = "Successfully updated review for #{@project.name}!"
    end
    redirect_to @hackathon
  end

  private
  def load_resources
    @project ||= Project.find(params['review']['project_id'])
    @hackathon ||= @project.hackathon
    if params['review']['id']
      @review = @project.reviews.select{|r| r.id.to_s == params['review']['id']}.first
    end

    unless @hackathon.is_judge?(current_user) || @hackathon.is_admin?(current_user)
      flash[:error] = 'Sorry, only judges can handle reviews'
      redirect_to @hackathon
    end

  end
end