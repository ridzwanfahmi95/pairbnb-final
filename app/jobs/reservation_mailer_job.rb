class ReservationMailerJob < ActiveJob::Base
  queue_as :default

  def perform(customer, host, booking_id)
    # Do something later
    ReservationMailer.booking_email(customer, host, booking_id).deliver_now
  
  end
end


