class AddPlaceToBooking < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :place, index: true
    add_reference :bookings, :user, index: true
  end
end
