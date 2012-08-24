class Review
  include MongoMapper::EmbeddedDocument

  one :judge
  belongs_to :project

end