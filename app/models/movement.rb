class Movement < ActiveRecord::Base

	belongs_to :user
	has_many :move_wods
	has_many :wods, through: :move_wods
end
