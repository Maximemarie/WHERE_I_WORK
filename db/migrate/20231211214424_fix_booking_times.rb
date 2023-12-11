class FixBookingTimes < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :date
    remove_column :bookings, :time
    add_column :bookings, :time, :datetime

  end
end
