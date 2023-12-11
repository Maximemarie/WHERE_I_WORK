class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @reviews = Review.where(user: current_user)
    @favorites = Favorite.where(user: current_user)
    @bookings = Booking.where(user: current_user)

    future_bookings = @bookings.where("date >= ?", Date.today).order(:date, :time)

    raise

  end

end
