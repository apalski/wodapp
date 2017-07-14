require 'spec_helper'

describe "Usermovement" do
	before do
		@usermovement = Usermovement.create(name: "Rope Climb", result: 10)

	end

	after do
		Usermovement.destroy_all
	end

	it "has a name and result" do
		expect(@usermovement.name).to eq("Rope Climb")
		expect(@usermovement.result).to eq(10)
	end
end