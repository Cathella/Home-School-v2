class Direction < ApplicationRecord
  validates :latitude, :longitude, :landmark, presence: true

  belongs_to :teacher, optional: true

  scope :get_lat_lon_array, -> { pluck(:latitude, :longitude ) }
end
