class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @reviews = Review.where(user: current_user)
    @favorites = Favorite.where(user: current_user)
    @bookings = Booking.where(user: current_user)
    @places = Place.all

    future_bookings = @bookings.where("time >= ?", DateTime.now).order(:time)
      @upcoming_booking = future_bookings.find { |booking| booking.time > DateTime.now }

  end

end
