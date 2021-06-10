class Direction < ApplicationRecord
  belongs_to :teacher
  validates :latitude, :longitude, :landmark, presence: true
end
