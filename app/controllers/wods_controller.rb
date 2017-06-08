class WodsController < ApplicationController

	def index
		@wods = Wod.all
	end

	def new
		@wod = Wod.new
		@wods = Wod.all
	end

	def create
		@wods = Wod.all
		@wod = Wod.new(wod_params)
		if @wod.save
			redirect_to wod_path(@wod)
		else
			render :new
		end		
	end

	def show
		set_wod
	end

	def edit
		set_wod
		if @wod.update(wod_params)
			redirect_to wod_path(@wod)
		else
			render :edit
		end		
	end

	def update
		set_wod
	end

	private

	def set_wod
		@wod = Wod.find(params[:id])
	end

	def wod_params
		params.require(:wod).permit(:name, :wod_type)
	end

	
end
