class Point < ApplicationRecord

  validates :lonlat, :direction, presence: true

  scope :directed, ->(params){ DirectedPointsQuery.new(self, params).find }

end
