class Address < ApplicationRecord
  validates :latitude, :longitude, :landmark, presence: true

  belongs_to :child, optional: true

  scope :get_lat_lon_array, -> { pluck(:latitude, :longitude ) }
end
 