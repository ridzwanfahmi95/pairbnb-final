class BookingsController < ApplicationController
 
 
 def create
        @listing = Listing.find(params[:listing_id])
        # byebug
        @booking = current_user.bookings.new(booking_params)
        @booking.listing = @listing
      if @booking.save
       ReservationMailerJob.perform_later(current_user, @listing.user, @booking_id)
      redirect_to current_user
      else
      @errors = @booking.errors.full_messages
      render "listings/show"
      end
 end

 def destroy
      @booking = Booking.find(params[:id])
      @booking.destroy
      redirect_to @booking.user
 end

    def booking_params
     params.require(:booking).permit(:num_guests, :start_date, :end_date)
    end
end
