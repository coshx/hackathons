require 'spec_helper'

describe Hackathon do
  let(:user)      { FactoryGirl.build(:user) }
  let(:hackathon) { FactoryGirl.build(:hackathon) }

  describe "is_judge?" do
    it "reports true for judges" do
      hackathon.judges << user
      hackathon.is_judge?(user).should be_true
    end

    it "reports false for non-users" do
      hackathon.is_judge?(user).should be_false
    end

    it "reports false for non-judges" do
      hackathon.admins << user
      hackathon.is_judge?(user).should be_false
    end
  end

  describe "is_admin?" do
    it "reports true for admins" do
      hackathon.admins << user
      hackathon.is_admin?(user).should be_true
    end

    it "reports false for non-users" do
      hackathon.is_admin?(user).should be_false
    end

    it "reports false for non-admins" do
      hackathon.participants << user
      hackathon.is_admin?(user).should be_false
    end
  end

  describe "is_participant?" do
    it "reports true for participants" do
      hackathon.participants << user
      hackathon.is_participant?(user).should be_true
    end

    it "reports false for non-users" do
      hackathon.is_participant?(user).should be_false
    end

    it "reports false for non-participants" do
      hackathon.judges << user
      hackathon.is_participant?(user).should be_false
    end
  end

  describe "is_user?" do
    it "reports true for judges" do
      hackathon.judges << user
      hackathon.save!
      hackathon.is_user?(user.reload).should be_true
    end

    it "reports true for admins" do
      hackathon.admins << user
      hackathon.save!
      hackathon.is_user?(user.reload).should be_true
    end

    it "reports true for participants" do
      hackathon.participants << user
      hackathon.save!
      hackathon.is_user?(user.reload).should be_true
    end

    it "reports false for non-users" do
      hackathon.is_user?(user).should be_false
    end

  end

end
