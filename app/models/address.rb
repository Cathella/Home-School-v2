class Address < ApplicationRecord
  belongs_to :child
  validates :landmark, presence: true
end
