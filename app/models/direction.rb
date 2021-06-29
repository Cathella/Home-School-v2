class Direction < ApplicationRecord
  belongs_to :teacher
  validates :landmark, :longitude, :latitude, presence: true
end
