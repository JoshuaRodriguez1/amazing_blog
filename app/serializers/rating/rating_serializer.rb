module Rating
  class RatingSerializer < ApplicationSerializer
    attributes :sum, :average, :estimate
  end
end
