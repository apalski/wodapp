
class SessionsController < ApplicationController

	def new
		
	end

	def create
		@user = User.find_by(name: params[:name])
		#return head(:forbidden) unless @user.authenticate(params[:name])
		session[:user_id] = @user.id
		redirect_to controller: 'application', action: 'welcome'
	end

	def destroy
		session.clear
		redirect_to root_path
	end
end