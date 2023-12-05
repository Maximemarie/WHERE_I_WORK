class Favorite < ApplicationRecord
  # A user can have many favorites places
  belongs_to :user
  has_many :places
end
