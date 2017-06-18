
module ApplicationHelper

	def current_user
		@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
	end

	def update_pr(newpr)
		if newpr.class == Usermovement
			moves = Usermovement.select {|move| move.pr == true if newpr.name == move.name}
		else
			moves = Userwod.select {|move| move.pr == true if newpr.name == move.name}
		end	
		if moves.size > 1
			moves[0].pr = false
			moves[0].save
		end		
	end

	def restrict_access	
		if current_user.owner == false
			redirect_to user_path(current_user), notice: "You can't view this page, contact your box owner"
		end	
	end
end
