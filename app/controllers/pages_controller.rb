class PagesController < ApplicationController

  def home
    if user_signed_in?
      redirect_to flats_path
    end

    if params[:query].present?
      @query = params[:query]
      @flats = Flat.where("name iLike :query OR location iLike :query OR description iLike :query", query: "%#{params[:query]}%")
    else
      @flats = Flat.all.first(3)
    end
  end

  def dashboard
    # My bookings as user
    @my_booking = current_user.bookings

    # My booking as host
    @bookings = Booking.joins(:flat).where(flat: { user_id: current_user.id })

    # Grab my own flats

     @my_flats = current_user.flats
  end
end
