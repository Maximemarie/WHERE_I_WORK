class Booking < ApplicationRecord
  # This is model for booking in our application
  # It belongs to user and place
  belongs_to :user
  belongs_to :place
  # It validates start_date and end_date
  validates :date, presence: true
  validates :time, presence: true
end
