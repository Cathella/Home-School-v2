class Address < ApplicationRecord
  belongs_to :child
  validates :latitude, :longitude, :landmark, presence: true
end
