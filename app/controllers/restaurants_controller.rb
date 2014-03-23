class RestaurantsController < ApplicationController
# 1. Update the Restaurant New & Create actions to require a currently logged in Owner.
# before_filter :owner_signed_in?
# 2. Update the Restaurant Create action to create a Restaurant owned by the currently logged in Owner
before_filter :authenticate_owner!, only: [:create, :update], except: [:show, :index]
# 3. Update the Restaurant Edit, Update and Destroy actions to require the currently logged in Owner to be the Restaurant’s Owner
# before_filter :current_owner, only: [:edit, :update, :destroy]

  # From SIB fall 2013...
  # before_filter :authenticate_owner!, :except => [:index, :show]
  # before_filter :require_restaurent_owner_match!, :only => [:edit, :update, :destroy]

def index
	@restaurants = Restaurant.all
end
def show
  @restaurant = Restaurant.find params[:id]
  @reservation = Reservation.new
  @category = Category.all

    unless @restaurant.owner == current_owner 
      render "unauthorized"
    end
end

def new
	@restaurant = Restaurant.new
  1.times { @restaurant.reservations.build }
   @category = Category.all
end
def create

  @restaurant = Restaurant.new restaurant_params
  @restaurant.owner = current_owner

    if @restaurant.save
        redirect_to @restaurant
    else
      render action: 'new'
    end
end
def edit
	@restaurant = Restaurant.find params[:id]
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
#   :owner_id, 
#   :photo,
#   :reservations => [
#     :reserve_on, 
#     :message,
#     :email ]
#   )
end

# def photo
#   @restaurant
# end


end
