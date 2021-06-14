class Group < ApplicationRecord
  belongs_to :teacher
  validates :name, :subject, :grade, presence: true
  validates_uniqueness_of :name
end
