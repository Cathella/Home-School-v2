class Video < ApplicationRecord
  validates :title, :youtube, :subject, :description, :grade, presence: true
  has_one_attached :thumbnail
end
