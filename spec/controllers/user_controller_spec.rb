require 'spec_helper'

describe UsersController do
	before do
		@user = User.create(:name => "Tom", :email => "tom@gmail.com", :password => "stocking")

		visit '/sessions/new'
		fill_in :name, :with => "Tom"
		fill_in :password, :with => "stocking"
		click_button "Sign In"
	end
	
	after do
		User.destroy_all
	end

	describe "/users/show" do
		it "can visit '/users/show'" do
			get '/users/1'
			expect(last_response.status).to eq(200)
		end
	end
end				
			