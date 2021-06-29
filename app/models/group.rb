class Group < ApplicationRecord
  belongs_to :teacher
  has_many :members, dependent: :destroy
  
  validates :name, :subject, :grade, presence: true
  validates_uniqueness_of :name
end
