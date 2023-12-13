class Favorite < ApplicationRecord
  # A user can have many favorites places
  belongs_to :user
  belongs_to :place
end
