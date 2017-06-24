class Admin::WodsController < ApplicationController

	before_action :restrict_access, only: [:new, :create, :edit,  :show, :update, :destroy]

	def index
		@wods = Admin::Wod.all.sort {|a,b| a.title <=> b.title}
	end

	def new
		@wod = Admin::Wod.new
		@movement = @wod.movements.build
		@movement = @wod.movements.build
		set_movements
	end

	def create
		set_movements
		@wod = Admin::Wod.new(wod_params)
		if @wod.save
			redirect_to admin_wod_path(@wod)
		else
			render :new
		end		
	end

	def show
		set_wod
	end

	def edit
		set_movements
		set_wod
	end

	def update
		set_movements
		set_wod
		if @wod.update(wod_params)
			redirect_to admin_wod_path(@wod)
		else
			render :edit
		end		
	end

	def destroy
		set_wod.destroy
		respond_to do |format|
			format.html {redirect_to admin_wods_path, notice: "WOD was successfully deleted"}
		end	
	end

	private

	def set_movements
		@movements = Admin::Movement.all
	end

	def set_wod
		@wod = Admin::Wod.find(params[:id])
	end

	def wod_params
		params.require(:admin_wod).permit(:title, :wod_type, :description, movement_ids: [], movements_attributes: [:name, :movement_type, :quantity])
	end
end
