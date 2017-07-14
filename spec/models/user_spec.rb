require 'spec_helper'

describe "User" do
	before do
		@wod1 = Admin::Wod.create(title: "Angie", wod_type: "time", description: "20min cap")
		@wod2 = Admin::Wod.create(title: "Cindy", wod_type: "repetitions", description: "20min AMRAP")

		@userwod1 = Userwod.create(name: "Angie", result: 15)
		@userwod2 = Userwod.create(name: "Cindy", result: 350)

		@movement1 = Admin::Movement.create(name: "Sit Ups", movement_type: "repetitions", quantity: 100)
		@movement2 = Admin::Movement.create(name: "Rope Climbs", movement_type: "repetitions", quantity: 10)

		@usermovement1 = Usermovement.create(name: "Sit Ups", result: 50)
		@usermovement2 = Usermovement.create(name: "Rope Climbs", result: 10)

		@user = User.create(:name => "Mary", :email => "mary@gmail.com", :password => "mary_007")
	end

	after do
		Admin::Wod.destroy_all
		Admin::Movement.destroy_all
		Userwod.destroy_all
		Usermovement.destroy_all
		User.destroy_all
	end
	
	it "has a name, an email and a password" do
		expect(@user.name).to eq("Mary")
		expect(@user.email).to eq("mary@gmail.com")	
		expect(@user.password).to eq("mary_007")
	end
	
	it "has many userwods" do
		@user.userwods << @userwod1
		@user.userwods << @userwod2
		expect(@user.userwods).to include(@userwod1)
		expect(@user.userwods).to include(@userwod2)
	end
	
	it "has many usermovements" do
		@user.usermovements << @usermovement1
		@user.usermovements << @usermovement2
		expect(@user.usermovements.count).to eq(2)
	end		
end

