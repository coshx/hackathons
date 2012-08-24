class Project
  include MongoMapper::Document

  key :name, String
  key :github_repo, String
  key :abstract, String

  belongs_to :hackathon
  many :nominations
  many :reviews
end
