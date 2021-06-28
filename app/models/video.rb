class Video < ApplicationRecord
  validates :title, :youtube_url, presence: true
end
