class PagesController < ApplicationController
  def home
  end

  def dashboard
    # My bookings as user
    @my_booking = current_user.bookings

    # My booking as host
    @bookings = Booking.joins(:flat).where(flat: { user_id: current_user.id })
  end
end
