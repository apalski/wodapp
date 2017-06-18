
module ApplicationHelper

	def current_user
		@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
	end

	def update_pr(newpr)
		moves = Usermovement.select {|move| move.pr == true if newpr.name == move.name}
		if moves.size > 1
			moves[0].pr = false
			moves[0].save
		end		
	end
end
