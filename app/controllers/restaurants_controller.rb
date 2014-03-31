class RestaurantsController < ApplicationController
# 1. Update the Restaurant New & Create actions to require a currently logged in user.
# before_filter :user_signed_in?
# 2. Update the Restaurant Create action to create a Restaurant owned by the currently logged in user
before_filter :authenticate_user!, only: [:create, :update], except: [:show, :index]
# 3. Update the Restaurant Edit, Update and Destroy actions to require the currently logged in user to be the Restaurant’s user
before_filter :find_restaurants, only: [:show, :edit, :update, :dest]
before_filter :current_user, only: [:edit, :update, :destroy]

  # From SIB fall 2013...
  # before_filter :authenticate_user!, :except => [:index, :show]
  # before_filter :require_restaurent_user_match!, :only => [:edit, :update, :destroy]

def index
	@restaurants = Restaurant.all
  @categories = Category.all
end
def show
  @reservation = Reservation.new
  @reservation.restaurant = @restaurant
  @category = @restaurant.categories
  # explain this code
  @starred = current_user.stars.exists?(:restaurant_id => @restaurant.id)
end
# I don't understand how to write any of this below in star
def star
  type = params[:type]
  restaurant = Restaurant.find(params[:id])

  if type == "star"
    # Why won't this work: current_user.stars << @starred
    current_user.stars.create(restaurant: restaurant)
    redirect_to :back
  else
    current_user.stars.where(:restaurant_id => restaurant.id).destroy_all
    redirect_to :back
    # redirect_to :back, notice: 'You unstarred ' + restaurant.name
  end
end

def new
	@restaurant = Restaurant.new
  1.times { @restaurant.reservations.build }
end
def create

  @restaurant = Restaurant.new restaurant_params

    if @restaurant.save
        redirect_to @restaurant
    else
      render action: 'new'
    end
end

def edit
  @category = @restaurant.categories
end

def update
    if @restaurant.update restaurant_params
      redirect_to @restaurant
    else
      render action: 'edit'
    end
end

def destroy
    @restaurant.destroy
    redirect_to restaurants_path
end
private
def restaurant_params
      params.require(:restaurant).permit(
        :name, 
        :description, 
        :address, 
        :phone, 
        :photo, 
        :category_ids => [])
end

def current_user
# if restaurants current user is it's owner

# make a method that asks if user is owner of restaurant and call it here
  # unless current_user = restaurant.user.owner 
  unless current_user == restaurant.owner?
    return "You're not the owner!"
  end
end

def find_restaurants
    @restaurant = Restaurant.find params[:id]
end
# def restaurant_param
# params.require(:restaurant).permit!
# # (
# #   :name, 
# #   :description, 
# #   :phone_number, 
# #   :address, 
# #   :user_id, 
# #   :photo,
# #   :reservations => [
# #     :reserve_on, 
# #     :message,
# #     :email ]
# #   )
# end

# def photo
#   @restaurant
# end


end
