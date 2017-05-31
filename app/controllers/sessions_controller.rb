
class SessionsController < ApplicationController

	def new
		
	end

	def create
		@user = User.find_by(name: params[:user][:name])
		return head(:forbidden) unless @user.authenticate(params[:user][:password])
		session[:user_id] = @user.user_id
		redirect_to user_path(@user)	
	end

end