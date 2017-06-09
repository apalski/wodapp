class Wod < ActiveRecord::Base

	attr_accessor :quantity

	belongs_to :owner, :class_name => "User"
	has_many :move_wods
	has_many :movements, through: :move_wods

	validates :title, presence: true
	validates :title, uniqueness: true
	validates :wod_type, inclusion: {in: %w(time weight repetitions), message: "%{value} is not a valid type"}

	def movements_attributes=(movements_attributes)
		movements_attributes.values.eac do |movement_attribute|
			move = Movement.find_or_create_by(name: movement_attribute[:name], movement_type: movement_attribute[:movement_type])
			self.movements << move
		end	
	end
end
