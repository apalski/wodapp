class UsermovementsController < ApplicationController

	def index
		@usermovements = Usermovement.all
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
			format.html {redirect_to movements_path, notice: "Movement was successfully deleted"}
		end	
	end

	private

	def set_usermovement
		@usermovement = Usermovement.find(params[:id])
	end

	def usermovement_params
		params.require(:usermovement).permit(:name, :date, :result, :pr)
	end
end
