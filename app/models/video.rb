class Video < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :clip
  has_one_attached :thumbnail
end
