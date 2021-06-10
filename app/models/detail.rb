class Detail < ApplicationRecord
  belongs_to :teacher
  validates :phone, :grade, presence: true
end
