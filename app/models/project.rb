class Project
  include MongoMapper::Document

  key :name, String
  key :github_url, String
  key :url, String
  key :abstract, String

  belongs_to :hackathon
  many :nominations
  many :reviews

  def is_reviewed_by?(user)
    # TODO: use a mongo query here
    reviews.select{|r| r.judge_id == user.id}.length > 0
  end

  def nominate!(award_name, judge)
    award = Award.find_by_name(award_name)
    existing = nominations.select{|n| n.award_id == award.id && n.judge_id == judge.id}
    if existing.empty?
      nominations << Nomination.new(:award_id => award.id, :judge_id => judge.id)
      save!
    end
  end
end
