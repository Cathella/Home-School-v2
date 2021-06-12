class Group < ApplicationRecord
  belongs_to :teacher
  validates :name, :subject, presence: true
  validates_uniqueness_of :name

  # geocoded_by :address
  # after_validation :geocode

  def address
    [teacher.direction.latitude, teacher.direction.longitude]
  end
end
