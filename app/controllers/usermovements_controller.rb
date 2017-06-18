class UsermovementsController < ApplicationController

	def index
		if params[:user_id]
			set_user
			if params[:user_id] == current_user.id.to_s
				@usermovements = User.find(params[:user_id]).usermovements
			else
				redirect_to user_path(current_user), notice: "No movements to display"	
			end	
		else
			redirect_to user_path(current_user), notice: "No movements to display"
		end		
	end

	def new
		if params[:user_id]
			set_user
			@usermovement = Usermovement.new(user_id: params[:user_id])
			set_movement
		else
			redirect_to users_path, notice: "User not found"
		end		
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
		if params[:user_id]
			set_user
			if current_user.id.to_s != params[:user_id]
				redirect_to user_usermovements_path(@user), notice: "Movement not found"
			else
				set_usermovement
			end		
		else
			set_usermovement
		end			
	end

	def edit
		if params[:user_id]
			set_user
			if @user.nil?
				redirect_to users_path, notice: "User not found"
			elsif @usermovement && @user.id == @usermovement.user_id
				set_usermovement
				set_movement
			else
				redirect_to user_usermovements_path(@user), notice: "Movement not found"	
			end
		else
			set_movement
		end	
	end

	def update
		set_usermovement
		if @usermovement.update(usermovement_params)
			if @usermovement.pr == true
				update_pr(@usermovement)
			end	
			redirect_to user_usermovement_path(current_user, @usermovement)
		else
			render :edit
		end		
	end

	def destroy
		if params[:user_id]
			set_user
			if params[:user_id] == current_user.id.to_s
				set_usermovement.destroy
				respond_to do |format|
					format.html {redirect_to user_usermovements_path(current_user), notice: "Movement was successfully deleted"}
				end
			else 
				redirect_to	redirect_to user_usermovements_path(@user), notice: "Movement not found"
			end
		else
			redirect_to user_usermovements_path(@user), notice: "Movement not found"
		end			
	end

	private

	def set_movement
		@movements = Movement.all
	end

	def set_user
		@user = User.find_by(id: params[:user_id])
	end

	def set_usermovement
		@usermovement = Usermovement.find_by(id: params[:id])
	end	

	def set_user
		@user = current_user
	end

	def usermovement_params
		params.require(:usermovement).permit(:name, :date, :result, :pr, :user_id)
	end
end
