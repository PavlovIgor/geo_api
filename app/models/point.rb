class Point < ApplicationRecord

  validates :lonlat, :direction, presence: true

end
