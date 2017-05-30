class Wod < ActiveRecord::Base

	belongs_to :user
	has_many :move_wods
	has_many :movements, through: :move_wods

	validates :name, presence: true
	validates :name, uniqueness: true
	validates :type, inclusion: {in: %w(time weight repetitions)}
end
