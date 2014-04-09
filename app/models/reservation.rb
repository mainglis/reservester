class Reservation < ActiveRecord::Base
	validates :email, :reserve_on, :restaurant_id, presence: true
	validate :reservation_user_same_day, on: :create
	validate :within_max_reservations, on: :create
	# validates :in_schedule, on: :create
	belongs_to :restaurant
end

# A Reservation does not already exist for the user for the same Restaurant for the same day
def reservation_user_same_day
	if Reservation.where(email: self.email, restaurant_id: self.restaurant, reservation: (Time.reserve_on.midnight - 1.day)..Time.reserve_on.midnight)
	# if user.reservation.restaurant.present? 
		errors.add(:reservation, "You already have a reservation")
	end
end

# The number of approved and pending reservations, plus one, would not exceed the max_reservations cap
def within_max_reservations
	if (Reservation.all.count + 1) > max_reservations
		errors.add(:max_reservations, "cannot exceed the maximum")
	end
end

# # The Reservation’s requested_at falls between the Restaurant’s scheduled open and 30 min before the Restaurant’s scheduled close times.
# def in_schedule
# 	if reservation.time
# 	end
# end