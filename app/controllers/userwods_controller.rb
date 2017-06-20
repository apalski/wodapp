class UserwodsController < ApplicationController

	include UserwodsHelper

	before_action :check_user
	skip_before_action :check_user, only: [:index, :new, :create]

	def index
		if params[:user_id] == current_user.id.to_s
			@userwods = User.find(params[:user_id]).userwods
		else
			redirect_to user_userwods_path(current_user), notice: "WODs not found"	
		end		
	end

	def new
		@userwod = Userwod.new(user_id: params[:user_id])
		set_user
		set_wod
	end

	def create
		@userwod = Userwod.new(userwod_params)
		set_user
		set_wod
		if @userwod.save
			wod = Admin::Wod.all.find_by(title: @userwod.name)
			@userwod.cftype = wod.wod_type
			@userwod.save
			if @userwod.pr == true
				update_pr(@userwod)
			end	
			redirect_to user_userwod_path(current_user, @userwod)
		else
			render :new
		end		
	end

	def show
		if set_userwod
			set_userwod
		else
			redirect_to user_userwods_path(current_user), notice: "WOD not found"
		end		
	end

	def edit
		set_userwod
		set_user
		set_wod
	end

	def update
		set_user
		set_wod
		set_userwod
		if @userwod.update(userwod_params)
			if @userwod.pr == true
				update_pr(@userwod)
			end	
			redirect_to user_userwod_path(current_user, @userwod)
		else
			render :edit
		end		
	end

	def destroy
		set_userwod.destroy
		respond_to do |format|
			format.html {redirect_to user_userwods_path(current_user), notice: "WOD was successfully deleted"}
		end	
	end

	private

	def set_wod
		@wods = Admin::Wod.all
	end

	def set_user
		@user = current_user
	end

	def set_userwod
		@userwod = Userwod.find(params[:id])
	end

	def userwod_params
		params.require(:userwod).permit(:name, :date, :result, :cftype, :pr, :user_id)
	end
end


