class ReservationMailer < ActionMailer::Base
  default from: "reservations@reservester.com"

def reservation_notification(reservation)
	@reservation = reservation
	@owner_email = @reservation.restaurant.owner.email
	@owner_name = @reservation.restaurant.owner.name

	mail(to: @owner_email, subject: "New reservation has been made")
end

end
