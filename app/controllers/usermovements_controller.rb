class UsermovementsController < ApplicationController

	def index
		@movements = Usermovement.all
		@user = current_user
	end

	def new
		@movement = Usermovement.new
		@moves = Usermovement.all
		@user = current_user
	end

	def create
		@user = current_user
		@movement = Usermovement.new(movement_params)
		if @movement.save
			redirect_to movement_path(@movement)
		else
			render :new
		end		
	end

	def show
		set_movement
	end

	def edit
		set_movement
		
	end

	def update
		set_movement
		if @movement.update(movement_params)
			redirect_to movement_path(@movement)
		else
			render :edit
		end		
	end

	private

	def set_movement
		@movement = Usermovement.find(params[:id])
	end

	def movement_params
		params.require(:movement).permit(:name, :date, :result, :pr)
	end
end
