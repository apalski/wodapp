
class SessionsController < ApplicationController

	skip_before_action :require_signin, only: [:new, :create]

	def new
		if current_user
			redirect_to user_path(current_user), notice: "You are already signed in"
		end	
	end
	
	def create    
		raise params 
		if auth_hash = request.env['omniauth.auth']
			if @user = User.find_by(name: auth_hash["info"]["name"])
				session[:user_id] = @user.id
			else @user = User.create_with_omniauth(auth_hash)
				session[:user_id] = @user.id
			end	
			redirect_to root_path
		else
			@user = User.find_by(:name => params[:user][:name])
			if @user && @user.authenticate(params[:user][:password])
				session[:user_id] = @user.id
				redirect_to root_path
			else
				flash[:notice] = "You couldn't be signed in, please check your name and password and try again"
				redirect_to sessions_new_path
			end
		end
	end

	def destroy
		session.clear
		respond_to do |format|
			format.html {redirect_to sessions_new_path, notice: "You are signed out"}
		end	
	end
end