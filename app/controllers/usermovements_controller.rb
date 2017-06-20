class UsermovementsController < ApplicationController

	include UsermovementsHelper

	before_action :check_user
	skip_before_action :check_user, only: [:index, :new, :create]

	def index
		if params[:user_id] == current_user.id.to_s
			@usermovements = User.find_by(id: params[:user_id]).usermovements
		else
			redirect_to user_usermovements_path(current_user), notice: "Movements not found"	
		end		
	end

	def new
		@usermovement = Usermovement.new(user_id: params[:user_id])
		set_user
		set_movement
	end

	def create
		@usermovement = Usermovement.new(usermovement_params)
		set_user
		set_movement
		if @usermovement.save
			move = Admin::Movement.all.find_by(name: @usermovement.name)
			@usermovement.cftype = move.movement_type
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
		if set_usermovement 
			set_usermovement
		else
			redirect_to user_usermovements_path(current_user), notice: "Movement not found"
		end			
	end

	def edit
		set_usermovement
		set_user
		set_movement
	end

	def update
		set_user
		set_movement
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

	def set_user
		@user = current_user
	end

	def set_movement
		@movements = Admin::Movement.all
	end

	def set_usermovement
		@usermovement = Usermovement.find_by(id: params[:id])
	end	

	def usermovement_params
		params.require(:usermovement).permit(:name, :date, :result, :cftype, :pr, :user_id)
	end
end
