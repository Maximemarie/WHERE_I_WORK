class Filter < ApplicationRecord

  FOODFILTERS = ["vegan", "gluten_free"]
  FEATUREFILTERS = ["wifi", "outlets"]
  AMBIANCES = ["Chill", "Quiet", "Lively"]

  belongs_to :place
end
