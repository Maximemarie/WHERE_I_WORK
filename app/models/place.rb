class Place < ApplicationRecord
  # This is model for place in our application
  has_many :reviews
  # It has many reviews and users through reviews
  has_many :users, through: :reviews
  # It has seveal attached photos
  has_many_attached :photos
  # It has many bookings
  has_many :bookings
  # It validates name, address and description
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
end
