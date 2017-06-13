class UserwodsController < ApplicationController
	
	def index
		@userwods = Userwod.all
	end

	def new
		@userwod = Userwod.new
		@wods = Wod.all
	end

	def create
		@userwod = Userwod.new(userwod_params)
		if @userwod.save
			wod = Wod.all.find_by(title: @userwod.name)
			@userwod.wod_type = wod.wod_type
			@userwod.save
			redirect_to userwod_path(@userwod)
		else
			render :new
		end		
	end

	def show
		set_userwod
	end

	def edit
		set_userwod
		if @userwod.update(userwod_params)
			redirect_to userwod_path(@userwod)
		else
			render :edit
		end		
	end

	def update
		set_userwod
	end

	private

	def set_userwod
		@userwod = Userwod.find(params[:id])
	end

	def userwod_params
		params.require(:userwod).permit(:name, :date, :result, :wod_type, :pr)
	end

	
end


