class RestaurantsController < ApplicationController
# 1. Update the Restaurant New & Create actions to require a currently logged in user.
# before_filter :user_signed_in?
# 2. Update the Restaurant Create action to create a Restaurant owned by the currently logged in user
before_filter :authenticate_user!, only: [:create, :update], except: [:show, :index]
# 3. Update the Restaurant Edit, Update and Destroy actions to require the currently logged in user to be the Restaurant’s user
before_filter :current_user, only: [:edit, :update, :destroy]

  # From SIB fall 2013...
  # before_filter :authenticate_user!, :except => [:index, :show]
  # before_filter :require_restaurent_user_match!, :only => [:edit, :update, :destroy]

def index
	@restaurants = Restaurant.all
  @categories = Category.all
end
def show
  @restaurant = Restaurant.find params[:id]
  @reservation = Reservation.new
  @reservation.restaurant = @restaurant
  @category = @restaurant.categories

    unless @restaurant.user == current_user 
      render "unauthorized"
    end
  # explain this code
  @starred = current_user.stars.exists?(:restaurant_id => @restaurant.id)
end

def star
  type = params[:type]
  restaurant = Restaurant.find(params[:id])

  if type == "star"
    current_user.stars.create(restaurant: restaurant)
    redirect_to :back
  else
    current_user.stars.where(:restaurant_id => restaurant.id).destroy_all
    redirect_to :back
  end 
end

def new
	@restaurant = Restaurant.new
  1.times { @restaurant.reservations.build }
end
def create

  @restaurant = Restaurant.new restaurant_params
  @restaurant.user = current_user

    if @restaurant.save
        redirect_to @restaurant
    else
      render action: 'new'
    end
end

def edit
	@restaurant = Restaurant.find params[:id]
  # OLD @restaurant.category = @category
  @category = @restaurant.categories
end

def update
	@restaurant = Restaurant.find params[:id]

    if @restaurant.update restaurant_params
      redirect_to @restaurant
    else
      render action: 'edit'
    end
end
def destroy
	@restaurant = Restaurant.find params[:id]
    @restaurant.destroy
    redirect_to restaurants_path
end
private

def restaurant_params
params.require(:restaurant).permit!
# (
#   :name, 
#   :description, 
#   :phone_number, 
#   :address, 
#   :user_id, 
#   :photo,
#   :reservations => [
#     :reserve_on, 
#     :message,
#     :email ]
#   )
end

# def current_user
#   @restaurant.user == current_user
#   redirect_to(root_url) unless current_user?(@owner)
# end

# def photo
#   @restaurant
# end


end
