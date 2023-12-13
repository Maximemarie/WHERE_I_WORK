class Place < ApplicationRecord
  # This is model for place in our application
  has_many :reviews
  # It has many reviews and users through reviews
  has_many :users, through: :reviews

  has_many :favorites

  has_one :filter
  # It has seveal attached photos
  has_many_attached :photos
  has_one_attached :menuboard

  # It has many bookings
  has_many :bookings
  # It validates name, address and description
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true

  # It geocodes the address
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
