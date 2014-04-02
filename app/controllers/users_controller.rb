class UsersController < ApplicationController

before_filter :authenticate_user!
before_filter :require_owner, only: :dashboard

# Create a Dashboard action and view that only Owners can access
# The Dashboard should display all of the Restaurants for the currently logged in Owner
# The site’s navigation should display a path to the Dashboard for logged in Owners
def dashboard
	@restaurants = current_user.restaurants
end

# Similar to the existing dashboard for Owners, create a dashboard for Patrons at /my-stars that displays the list of Restaurants that a User has Starred
# Create a link to this dashboard in the main navigation and display it to all logged in Users
# On the Owners’ dashboard, display, for each Restaurant, the total number of stars that the Restaurant has received.

def my_stars
	@starred = current_user.stars
end

private 

def require_owner
	current_user.owner?
end	

end
