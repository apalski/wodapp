
class SessionsController < ApplicationController

	def create
		session[:username] = params[:user][:name]
		@user = User.find_by(name: params[:user][:name])
		return head(:forbidden) unless @user.authenticate(params[:user][:password])
		session[:user_id] = @user.id
		redirect_to controller: 'application', action: 'welcome'
	end

	def destroy
		session.clear
		respond_to do |format|
			format.html {redirect_to sessions_new_path, notice: "You are signed out"}
		end	
	end
end