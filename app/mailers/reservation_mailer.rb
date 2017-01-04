class ReservationMailer < ApplicationMailer
	default from: ENV['gmail_username']
	
  def booking_email(customer, host, booking_id)
  	@customer = customer
  	@host = host
  	@booking_id = booking_id
 
  	mail(to: @host.email, subject: "Congratz, You got a New Booking!" )
  end
	
	
end

#mailer controller
