class Profile < ApplicationRecord
  belongs_to :child
  validates :phone, :grade, presence: true
end
