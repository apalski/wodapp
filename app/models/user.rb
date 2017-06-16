class User < ActiveRecord::Base

	has_many :wods
	has_many :movements
	has_many :usermovements
	has_many :userwods

	has_secure_password

	validates :name, :email, presence: true
	validates :name,:email, uniqueness: true
	validates :password, length: {minimum: 6}

	def self.create_with_omniauth(auth)
	    create! do |user|
	      user.provider = auth["provider"]
	      user.uid = auth["uid"]
	      user.name = auth["info"]["name"]
	      user.email = auth["info"]["email"]
	      user.password_digest = SecureRandom.urlsafe_base64
	    end
  	end
end
