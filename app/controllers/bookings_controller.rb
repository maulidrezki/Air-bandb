class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @review = Review.new
  end

  def update
    raise
  end
end
