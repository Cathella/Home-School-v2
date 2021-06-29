class Address < ApplicationRecord
  belongs_to :child
  validates :landmark, :longitude, :latitude, presence: true
end
