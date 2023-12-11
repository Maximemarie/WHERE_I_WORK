class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @reviews = Review.where(["user_id = current_user.id"])
    @favorites = Favorite.where(["user_id = current_user.id"])
    @bookings = Booking.where(["user_id = current_user.id"])
  end

end
