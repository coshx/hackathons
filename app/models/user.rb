class User
  include MongoMapper::Document

  key :name, String
  key :email, String
  key :github_name, String
  key :image, String

  key :hackathon_ids, Array
  many :hackathons, :in => :hackathon_ids

  def self.find_or_create_with_omniauth(auth)
    user = find_by_github_name(auth['info']['nickname'])
    user ||= create! :email => auth['info']['email'],
                     :name  => auth['info']['name'],
                     :image => auth['info']['image'] 
  end

end
