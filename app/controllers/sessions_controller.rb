
class SessionsController < ApplicationController

	def create
		session[:username] = params[:name]
		@user = User.find_by(name: params[:name])
		return head(:forbidden) unless @user.authenticate(params[:name])
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