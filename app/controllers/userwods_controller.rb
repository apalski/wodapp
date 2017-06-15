class UserwodsController < ApplicationController
	
	def index
		@userwod = []
		Userwod.all.each do |wod|
			if wod.user_id == current_user.id
				@userwods << wod
			end	
		end	
		@user = current_user 
	end

	def new
		@userwod = Userwod.new
		@wods = Wod.all
	end

	def create
		@userwod = Userwod.new(userwod_params)
		if @userwod.save
			wod = Wod.all.find_by(title: @userwod.name)
			@userwod.user_id = @user.id
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
	end

	def update
		set_userwod
		if @userwod.update(userwod_params)
			redirect_to userwod_path(@userwod)
		else
			render :edit
		end		
	end

	def destroy
		set_userwod.destroy
		respond_to do |format|
			format.html {redirect_to userwods_path, notice: "WOD was successfully deleted"}
		end	
	end

	private

	def set_userwod
		@userwod = Userwod.find(params[:id])
	end

	def userwod_params
		params.require(:userwod).permit(:name, :date, :result, :wod_type, :pr)
	end

	
end


