class UsersController < ApplicationController

before_filter :authenticate_user!

def dashboard
end

# Create a method on User named ‘owner?’ and return true 
# when the User has the ‘owner’ role, otherwise return false
def owner
	if user.role == 'owner'
		return true
	else
		return false 
end

# Create a method on User named ‘patron?’ and return true 
# when the User has the ‘patron’ role, otherwise return false
def patron
	if user.role == 'patron'
		return true
	else
		return false
end



end
