class UsermovementsController < ApplicationController

	before_action :restrict_access, only: [:index, :edit, :update, :destroy]

	def index
		@usermovements = []
		Usermovement.all.each do |move|
			if move.user_id == current_user.id
				@usermovements << move
			end	
		end	
		@user = current_user 
	end

	def new
		@usermovement = Usermovement.new
		@movements = Movement.all
		@user = current_user
	end

	def create
		@user = current_user
		@usermovement = Usermovement.new(usermovement_params)
		if @usermovement.save
			move = Movement.all.find_by(name: @usermovement.name)
			@usermovement.user_id = @user.id
			@usermovement.movement_type = move.movement_type
			@usermovement.save
			redirect_to usermovement_path(@usermovement)
		else
			render :new
		end		
	end

	def show
		set_usermovement
		@movement = Movement.find_by(name: @usermovement.name)
	end

	def edit
		set_usermovement
		@movements = Movement.all
	end

	def update
		set_usermovement
		if @usermovement.update(usermovement_params)
			redirect_to usermovement_path(@usermovement)
		else
			render :edit
		end		
	end

	def destroy
		set_usermovement.destroy
		respond_to do |format|
			format.html {redirect_to usermovements_path, notice: "Movement was successfully deleted"}
		end	
	end

	private

	def set_usermovement
		@usermovement = Usermovement.find(params[:id])
	end

	def set_user
		@user = current_user
	end

	def usermovement_params
		params.require(:usermovement).permit(:name, :date, :result, :pr)
	end

	def restrict_access
		if !@usermovement || @usermovement.user_id != current_user.id 
			flash[:notice] = "You do not have any movements or this is not your information to access"
			redirect_to user_path(current_user)
		end	
	end
end
