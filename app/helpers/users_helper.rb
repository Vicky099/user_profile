module UsersHelper

	def own_record(current_user, user)
		return current_user.id == user.id
	end
end
