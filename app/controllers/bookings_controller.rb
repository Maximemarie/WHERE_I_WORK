class BookingsController < ApplicationController
  before_action :set_place, except: [ :destroy, :index ]

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.place = @booking
    if @booking.save
      redirect_to booking_path(@booking)
      # it should redirect to the show booking page
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @booking = Booking.new
  end

  def destroy
    @booking = Boooking.find(params[:id])
    @booking.destroy
    redirect_to place_path(@booking.place), status: :see_other
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def booking_params
    params.require(:booking).permit(:time, :date)
  end

end
