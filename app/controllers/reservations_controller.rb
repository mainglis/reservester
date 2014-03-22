class ReservationsController < ApplicationController

	def create
		@restaurant = Restaurant.find params[:restaurant_id]
		@reservation = @restaurant.reservations.build(reservation_params)

		if @reservation.save
		  redirect_to @restaurant, :notice => 'Your reservation has been created'
		else
		  render 'restaurant/show'
		end
	end

	def show
		unless @restaurant.owner == current_owner 
	      render "unauthorized"
	    end
	end

	def destroy
		@reservation = Reservation.find params[:id]
	    @reservation.destroy

	    redirect_to @reservation.restaurant
	end

	private

	def reservation_params
		params.require(:reservation).permit(:message, :reserve_on, :email)
	end

end
