
module ApplicationHelper

	def current_user
		@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
	end

	def update_pr(newpr)
		if newpr.class == Usermovement
			moves = current_user.usermovements.by_pr
		else
			moves = current_user.userwods.by_pr
		end	
		if moves.size > 1
			combo = moves.combination(2).select {|a,b| a.name == b.name}
			if combo[0].type == "time"
				if combo[1].result > combo[0].result
					combo[0].update_attribute(pr: true)
					combo[1].update_attribute(pr: false)
				else
					combo[0].update_attribute(pr: false)
					combo[1].update_attribute(pr: true)
				end
			else
				if combo[0].result > combo[1].result
					combo[0].update_attribute(pr: true)
					combo[1].update_attribute(pr: false)
				else
					combo[0].update_attribute(pr: false)
					combo[1].update_attribute(pr: true)
				end
			end		
		end		
	end

	def restrict_access	
		if current_user.owner == false
			redirect_to user_path(current_user), notice: "You can't view this page, contact your box owner"
		end	
	end
end
