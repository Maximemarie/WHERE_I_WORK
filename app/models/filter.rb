class Filter < ApplicationRecord

  FILTERS = ["vegan", "gluten_free", "wifi", "outlets"]
  AMBIANCES = ["chill", "calm", "social"]

  belongs_to :place
end
