class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @review = Review.new
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(status: params[:status])
      redirect_to dashboard_path
    else
      render 'dashboard'
    end
  end
end
