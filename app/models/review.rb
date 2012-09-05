class Review
  include MongoMapper::EmbeddedDocument

  key :comments, String
  key :judge_id, ObjectId

  belongs_to :project

  def judge
    User.find(judge_id)
  end
end