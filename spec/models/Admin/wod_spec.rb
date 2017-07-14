require 'spec_helper'

describe "Wod" do
	before do
		@wod = Admin::Wod.create(title: "Angie", wod_type: "time", description: "20min cap")

	end

	after do
		Admin::Wod.destroy_all
	end

	it "has a title, wod type and description" do
		expect(@wod.title).to eq("Angie")
		expect(@wod.wod_type).to eq("time")
		expect(@wod.description).to eq("20min cap")
	end
end