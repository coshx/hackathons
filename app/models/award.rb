class Award
  include MongoMapper::Document

  key :name, String
  key :description, String
  key :prize, String
  key :is_plurality, Boolean

  belongs_to :hackathon

end
