
class SessionsController < ApplicationController

	skip_before_action :require_signin, only: [:new, :create]
	
	def create
		session[:username] = params[:user][:name]
		@user = User.find_by(name: params[:user][:name])
		if !@user.authenticate(params[:user][:password])
			flash[:notice] = "You couldn't be signed in, please check your name and password and try again"
			render sessions_new_path
		else
			session[:user_id] = @user.id
			redirect_to controller: 'application', action: 'welcome'
		end	
	end

	def destroy
		session.clear
		respond_to do |format|
			format.html {redirect_to sessions_new_path, notice: "You are signed out"}
		end	
	end
end