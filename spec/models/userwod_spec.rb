require 'spec_helper'

describe "Userwod" do
	before do
		@userwod = Userwod.create(name: "Angie", result: 350)

	end

	after do
		Userwod.destroy_all
	end

	it "has a name and result" do
		expect(@userwod.name).to eq("Angie")
		expect(@userwod.result).to eq(350)
	end
end