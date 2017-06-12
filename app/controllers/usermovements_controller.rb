class UsermovementsController < ApplicationController

	def index
		@usermovements = Usermovement.all
		@user = current_user
		@movement = Movement.find_by(name: @usermovements.name)
	end

	def new
		@usermovement = Usermovement.new
		@usermoves = Usermovement.all
		@user = current_user
	end

	def create
		@user = current_user
		@usermovement = Usermovement.new(usermovement_params)
		if @usermovement.save
			redirect_to usermovement_path(@usermovement)
		else
			render :new
		end		
	end

	def show
		set_usermovement
		@movement = Movement.find_by(name: @usermovement.name)
	end

	def edit
		set_usermovement
		
	end

	def update
		set_usermovement
		if @usermovement.update(usermovement_params)
			redirect_to usermovement_path(@usermovement)
		else
			render :edit
		end		
	end

	private

	def set_usermovement
		@usermovement = Usermovement.find(params[:id])
	end

	def usermovement_params
		params.require(:usermovement).permit(:name, :date, :result, :pr)
	end
end
