require 'spec_helper'

describe Project do
  let(:project) { FactoryGirl.create :project }
  let(:user) { FactoryGirl.create :user }

  describe "is_reviewed_by" do
    it "returns false when there are no reviews" do
      project.is_reviewed_by?(user).should be_false
    end

    it "returns false when there are no reviews by the judge" do
      project.reviews << Review.new(:judge_id => FactoryGirl.create(:user).id)
      project.save!
      project.is_reviewed_by?(user).should be_false
    end

    it "returns true when there is a review by the judge" do
      project.reviews << Review.new(:judge_id => user.id)
      project.save!
      project.is_reviewed_by?(user.reload).should be_true
    end
  end

end
