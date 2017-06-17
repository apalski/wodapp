
class SessionsController < ApplicationController

	skip_before_action :require_signin, only: [:new, :create]
	
	def create     
		if request.env['omniauth.auth']
			@user = User.create_with_omniauth(auth)
			session[:user_id] = @user.id
			redirect_to home_path
		else
			@user = User.find_by(:email => params[:user][:email])
			session[:username] = params[:user][:name]
			if @user && @user.authenticate(params[:user][:password])
				session[:user_id] = @user.id
				redirect_to root_path
			else
				flash[:notice] = "You couldn't be signed in, please check your name and password and try again"
				redirect_to login_path
			end
		end
	end

	def destroy
		session.clear
		respond_to do |format|
			format.html {redirect_to sessions_new_path, notice: "You are signed out"}
		end	
	end

	private

	def auth
		request.env['omniauth.auth']
	end
end