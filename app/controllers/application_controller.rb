
class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
 	# For APIs, you may want to use :null_session instead.

	protect_from_forgery with: :exception

	before_action :require_signin
	before_action :restrict_access

	include ApplicationHelper

	def welcome
		redirect_to controller: 'sessions', action: 'new' unless current_user
		@user = current_user
	end

	private

	def require_signin
		unless current_user
			flash[:notice] = "You must be a registered user and be signed in to use WODapp"
			redirect_to new_user_path
		end	
	end

	def restrict_access
		if current_user != @user && current_user.owner == false
			flash[:notice] = "You can only access your own information"
			redirect_to user_path(current_user)
		end	
	end
end