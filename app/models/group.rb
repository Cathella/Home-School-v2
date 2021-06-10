class Group < ApplicationRecord
  belongs_to :teacher
  validates :name, :subject, presence: true
  validates_uniqueness_of :name
end
