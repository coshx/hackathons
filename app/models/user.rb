class User
  include MongoMapper::Document

  key :name, String
  key :email, String
  key :github_name, String
  key :image, String

  key :hackathon_ids, Array
  many :hackathons, :in => :hackathon_ids

  def self.find_or_create_with_omniauth(auth)
    user = find_or_create_by_github_name(auth['info']['nickname'])
    user.email = auth['info']['email']
    user.name  = auth['info']['name']
    user.image = auth['info']['image']
    user.save!

    user
  end

end
