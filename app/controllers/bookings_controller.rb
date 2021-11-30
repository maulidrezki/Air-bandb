class BookingsController < ApplicationController

   def create
    @booking = Booking.new(params[:booking])
    if @booking.save
      redirect_to
   end

end
