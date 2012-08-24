class Review
  include MongoMapper::EmbeddedDocument

  key :comments, String
  key :judge_id, ObjectId

  belongs_to :project

end