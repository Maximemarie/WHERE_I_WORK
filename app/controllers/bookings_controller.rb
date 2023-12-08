class BookingsController < ApplicationController
  before_action :set_place, except: [ :destroy, :index, :show]

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.place = @place
    @booking.status = "pending"
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to booking_path(@booking)
      # it should redirect to the show booking page
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @booking = Booking.new
    @place
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to place_path(@booking.place), status: :see_other
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def booking_params
    params.require(:booking).permit(:time, :date)
  end

end
