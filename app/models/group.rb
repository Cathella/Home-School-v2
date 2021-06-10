class Group < ApplicationRecord
  belongs_to :teacher
  validates :name, :subject, presence: true
end
