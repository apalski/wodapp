class UsersController < ApplicationController

	skip_before_action :require_signin, only: [:new, :create]
	skip_before_action :restrict_access, only: [:new, :create]

	def index
		if current_user.owner == true
			@users = User.all
		else
			flash[:notice] = "You don't have permission for this page, see your box owner"
			redirect_to user_path(current_user)
		end		
	end

	def new
		@user = User.new
	end

	def create
	@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to sessions_new_path
		else
		 	render :new
		end		
	end

	def show
		set_user
	end

	def edit
		set_user
	end

	def update
		set_user
		if @user.update(user_params)
			redirect_to users_path(@user)
		else
			render :edit
		end		
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
		params.require(:user).permit(:name, :email, :password, :owner)		
	end	
end
