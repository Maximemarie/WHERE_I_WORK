class Review < ApplicationRecord
  # This is model for review in our application
  # It belongs to user and place
  belongs_to :user
  belongs_to :place
  # It validates rating and content
  validates :rating, presence: true
  validates :content, presence: true

  validates :rating, numericality: { in: 1..5 }
  validates :rating, numericality: true
end
