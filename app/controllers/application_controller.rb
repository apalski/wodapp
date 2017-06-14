
class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
 	# For APIs, you may want to use :null_session instead.

	protect_from_forgery with: :exception
	
	before_action :require_login

	include ApplicationHelper

	def welcome
		redirect_to controller: 'sessions', action: 'new' unless current_user
		@user = current_user
	end
end