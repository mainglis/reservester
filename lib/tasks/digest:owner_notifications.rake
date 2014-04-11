
namespace :digest do 
 	desc "Generates and sends an email each Owner with the pending Reservations for each of their Restaurants and Reservations that are scheduled for the current day."

	task :owner_notifications => :environment do 

	end
	task(:mail_users => :environment) do
     UserMailer.demo_mail(user).deliver! 
end 