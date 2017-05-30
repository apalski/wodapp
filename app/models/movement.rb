class Movement < ActiveRecord::Base

	belongs_to :user
	has_many :move_wods
	has_many :wods, through: :move_wods

	validates :name, presence: true
	validates :name, uniqueness: true
	validates :type, inclusion: {in: %w(time weight repetitions), message: "%{value} is not a valid type"}
end
