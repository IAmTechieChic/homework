class UserPermission
	attr_reader :user_id

	def initialize(user_id)
		@user_id = user_id
	end

	def assign_role(org_id, role)
		return "/User role is: #{role}/"
	end

	def get_user_orgs(org_id)
		return [819,8191,8193,8194]
	end

end