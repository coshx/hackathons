class Nomination
  include MongoMapper::EmbeddedDocument

  one :judge
  one :award
  belongs_to :project

end