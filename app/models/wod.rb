class Wod < ActiveRecord::Base

	attr_accessor :quantity

	belongs_to :owner, :class_name => "User"
	has_many :move_wods
	has_many :movements, through: :move_wods

	validates :name, presence: true
	validates :name, uniqueness: true
	validates :wod_type, inclusion: {in: %w(time weight repetitions), message: "%{value} is not a valid type"}
end
