class Admin::WodsController < ApplicationController

	before_action :restrict_access, only: [:new, :create, :edit, :update, :destroy]

	def index
		@wods = Wod.all
	end

	def new
		@wod = Wod.new
		@wod.movements.build
		@wod.movements.build
	end

	def create
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
	end

	def update
		set_wod
		if @wod.update(wod_params)
			redirect_to wod_path(@wod)
		else
			render :edit
		end		
	end

	def destroy
		set_wod.destroy
		respond_to do |format|
			format.html {redirect_to wods_path, notice: "WOD was successfully deleted"}
		end	
	end

	private

	def set_wod
		@wod = Wod.find(params[:id])
	end

	def wod_params
		params.require(:wod).permit(:title, :wod_type, :description, movement_ids: [], movements_attributes: [:name, :movement_type, :quantity])
	end
end
