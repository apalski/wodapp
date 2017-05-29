
class ApplicationController < ActionController::Base

	Protect_from_forgery with: :exception
	include ApplicationHelper


end