class Detail < ApplicationRecord
  belongs_to :teacher
  validates :phone, presence: true
end
