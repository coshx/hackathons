class Hackathon
  include MongoMapper::Document

  key :name, String
  key :description, String
  key :starts_at, Time
  key :ends_at, Time
  key :judging_starts_at, Time
  key :judging_ends_at, Time

  key :judge_ids, Array
  key :participant_ids, Array
  key :admin_ids, Array

  many :judges,        :in => :judge_ids,        :class_name => 'User'
  many :participants,  :in => :participant_ids,  :class_name => 'User'
  many :admins,        :in => :admin_ids,        :class_name => 'User'

  many :projects
  many :awards

  after_save :update_users

  def is_judge?(user)
    judges.include?(user)
  end

  def is_participant?(user)
    participants.include?(user)
  end

  def is_admin?(user)
    admins.include?(user)
  end

  def is_user?(user)
    user.hackathons.include?(self)
  end

  private
  def update_users
    judges.each do |user|
      user.hackathons << self
      user.save!
    end

    participants.each do |user|
      user.hackathons << self
      user.save!
    end

    admins.each do |user|
      user.hackathons << self
      user.save!
    end
  end

end
