class User < ActiveRecord::Base

	has_many :wods
	has_many :movements
	has_many :usermovements
	has_many :userwods

	has_secure_password

	validates :name, :email, presence: true
	validates :name,:email, uniqueness: true
	validates :password, length: {minimum: 6}

	def self.create_with_omniauth(auth_hash)
	    User.create(uid: auth_hash["uid"], name: auth_hash["info"]["name"], email: auth_hash["info"]["email"], password: SecureRandom.base64(10))
  	end
end
