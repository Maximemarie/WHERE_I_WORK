class Filter < ApplicationRecord

  FOODFILTERS = ["vegan", "gluten_free"]
  FEATUREFILTERS = ["wifi", "outlets"]
  AMBIANCES = ["chill", "calm", "social"]

  belongs_to :place
end
