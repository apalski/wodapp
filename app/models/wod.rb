class Wod < ActiveRecord::Base

	belongs_to :user
	has_many :move_wods
	has_many :movements, through: :move_wods
end
