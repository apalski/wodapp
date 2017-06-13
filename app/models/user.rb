class User < ActiveRecord::Base

	has_many :wods
	has_many :movements
	has_many :usermovements

	has_secure_password
	
	validates :name, :email, presence: true
	validates :name,:email, uniqueness: true
	validates :password, length: {minimum: 6}
end
