class ReservationMailer < ActionMailer::Base
  default from: "reservations@reservester.com"

def reservation_notification(reservation)
	@reservation = reservation
	@user_email = @reservation.restaurant.user.email
	@user_name = @reservation.restaurant.user.name

	mail(to: @user_email, subject: "New reservation has been made")
end

end
