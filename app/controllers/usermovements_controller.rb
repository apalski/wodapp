class UsermovementsController < ApplicationController

	def index
		if params[:user_id] == current_user.id.to_s
			@usermovements = User.find_by(id: params[:user_id]).usermovements
		else
			redirect_to user_usermovements_path(current_user), notice: "Movement not found"	
		end		
	end

	def new
			@usermovement = Usermovement.new(user_id: params[:user_id])
			@user = current_user
			set_movement
	end

	def create
		@usermovement = Usermovement.new(usermovement_params)
		if @usermovement.save
			move = Movement.all.find_by(name: @usermovement.name)
			@usermovement.movement_type = move.movement_type
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
		if current_user.id.to_s == params[:user_id]
			if set_usermovement && set_usermovement.user_id == current_user.id
				set_usermovement
			else
				redirect_to user_usermovements_path(current_user), notice: "Movement not found"
			end	
		else	
			redirect_to user_usermovements_path(current_user), notice: "Movement not found"
		end			
	end

	def edit
		if current_user.id == set_usermovement.user_id
			set_usermovement
			@user = current_user
			set_movement
		else
			redirect_to user_usermovements_path(current_user), notice: "Movement not found"	
		end
	end

	def update
		set_usermovement
		if @usermovement.update(usermovement_params)
			redirect_to user_usermovement_path(current_user, @usermovement)
		else
			render :edit
		end		
	end

	def destroy
		if params[:user_id] == current_user.id.to_s
			set_usermovement.destroy
			respond_to do |format|
				format.html {redirect_to user_usermovements_path(current_user), notice: "Movement was successfully deleted"}
			end
		else 
			redirect_to	redirect_to user_usermovements_path(@user), notice: "Movement not found"
		end	
	end

	private

	def set_movement
		@movements = Movement.all
	end

	def set_usermovement
		@usermovement = Usermovement.find_by(id: params[:id])
	end	

	def usermovement_params
		params.require(:usermovement).permit(:name, :date, :result, :pr, :user_id)
	end
end
