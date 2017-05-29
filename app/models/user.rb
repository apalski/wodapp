class User < ActiveRecord::Base

	has_many :wods
	has_many :movements
end
