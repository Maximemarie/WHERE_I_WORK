class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # A user has many reviews
  has_many :reviews
  # A user has many places through reviews
  has_many :places, through: :reviews
  # A user has many bookings
  has_many :bookings
  # A user has many places through bookings
  has_many :places, through: :bookings
  # A user has one attached photo
  has_one_attached :photo
end
