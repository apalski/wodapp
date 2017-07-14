require 'spec_helper'

describe "Movement" do
	before do
		@movement = Admin::Movement.create(name: "Rope Climb", movement_type: "repetitions", quantity: 10)

	end

	after do
		Admin::Wod.destroy_all
	end

	it "has a name, movement type and quantity" do
		expect(@movement.name).to eq("Rope Climb")
		expect(@movement.movement_type).to eq("repetitions")
		expect(@movement.quantity).to eq(10)
	end
end