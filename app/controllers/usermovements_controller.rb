class UsermovementsController < ApplicationController

	def index
		if params[:user_id]
			@usermovements = User.find(params[:user_id]).usermovements
		else
			redirect_to user_path(current_user)
		end		
	end

	def new
		@usermovement = Usermovement.new
		@movements = Movement.all
	end

	def create
		@usermovement = Usermovement.new(usermovement_params)
		if @usermovement.save
			move = Movement.all.find_by(name: @usermovement.name)
			@usermovement.user_id = current_user.id
			@usermovement.movement_type = move.movement_type
			@usermovement.save
			if @usermovement.pr == true
				update_pr(@usermovement)
			end	
			redirect_to user_usermovement_path(current_user, @usermovement)
		else
			render :new
		end		
	end

	def show
		set_usermovement
	end

	def edit
		set_usermovement
		@movements = Movement.all
	end

	def update
		set_usermovement
		if @usermovement.update(usermovement_params)
			redirect_to user_usermovement_path(current_user, @usermovement)
		else
			render :edit
		end		
	end

	def destroy
		set_usermovement.destroy
		respond_to do |format|
			format.html {redirect_to user_usermovements_path(current_user), notice: "Movement was successfully deleted"}
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
end
