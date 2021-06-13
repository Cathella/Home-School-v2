class Direction < ApplicationRecord
  belongs_to :teacher
  validates :landmark, presence: true
end
