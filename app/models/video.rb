class Video < ApplicationRecord
  validates :title, :youtube, presence: true
end
