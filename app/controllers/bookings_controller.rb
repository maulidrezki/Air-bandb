class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @flat = Flat.find(params[:flat_id])
    @booking.user = current_user
    @booking.flat = @flat
    @booking.status = "pending"
    if @booking.save
      redirect_to dashboard_path
    else
      render 'flats/show'
    end
  end

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

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
