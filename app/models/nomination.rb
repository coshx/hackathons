class Nomination
  include MongoMapper::EmbeddedDocument

  key :judge_id, ObjectId
  key :award_id, ObjectId

  def judge
    User.find(judge_id)
  end

  def award
    Award.find(award_id)
  end
end