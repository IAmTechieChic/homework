require_relative '../lib/user'
require_relative '../lib/userpermission'

describe UserPermission do
	before :each do
		@role = double('role')
		@role.stub(:role_id).and_return(1)
		@role.stub(:role_name).and_return('Admin')

		@org = double('org')
		@org.stub(:org_id).and_return(819)
		@org.stub(:org_name).and_return('Organization 1')
		@org.stub(:org_parten).and_return('Root Organization')


		@user = User.new(1123)
		@user.stub(:current_user).and_return(@user)
		
		@userpermission = UserPermission.new @user
	end

	it "assign user to USER role" do
		role = double('role')
		org = double('org')
		role.stub(:role_name).and_return('User')
		role.stub(:role_id).and_return(2)
		org.stub(:orgid).and_return('3003')

		@userpermission.assign_role(org.orgid, role.role_name).should =~ /User role is: User/
	end

	it "assign user to DENIED role" do
		role = double('role')
		org = double('org')
		role.stub(:role_name).and_return('Denied')
		role.stub(:role_id).and_return(3)
		org.stub(:orgid).and_return('3003')

		@userpermission.assign_role(org.orgid, role.role_name).should =~ /User role is: Denied/
	end


	it "get user org permissions" do
		expect(@userpermission.get_user_orgs(@org.org_id)).not_to include(3003)
	end



end