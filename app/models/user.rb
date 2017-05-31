class User < ActiveRecord::Base

	has_many :wods
	has_many :movements

	has_secure_password
	validates :name, :email, presence: true
	validates :name,:email, uniqueness: true
	#validates :password, length: {minimum: 6}

	enum role: [:user, :admin]

	after_initialize :set_default_role, if: :new_record?

	private

	def set_default_role
		self.role ||= :user
	end
end
