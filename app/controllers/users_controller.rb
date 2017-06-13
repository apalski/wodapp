class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.password == @user.password_confirmation
			if @user.save
				session[:user_id] = @user.id
				render new_session
			else
			 	render :new
			end	
		else
			redirect_to new_users
		end			
	end

	def show
		set_user
	end

	def destroy
		set_user.destroy
		respond_to do |format|
			format.html {redirect_to users_path, notice: "User was successfully deleted"}
		end	
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :owner)		
	end	
end
