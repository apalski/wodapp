class MovementsController < ApplicationController

	def index
		@movements = Movement.all
		@user = current_user
	end

	def new
		if current_user.admin == true
			@movement = Movement.new
		else
			redirect_to movements_path, alert: "You are not able to create movements"
		end		
	end

	def create
		@movement = Movement.new(movement_params)
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
		if @movement.update(movement_params)
			redirect_to movement_path(@movement)
		else
			render :edit
		end		
	end

	def update
		set_movement
	end

	private

	def set_movement
		@movement = Movement.find(params[:id])
	end

	def movement_params
		params.require(:movement).permit(:name, :date, :result, :type, :pr)
	end
end
