class Group < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  validates_presence_of :name, :grade, :place

  has_many :children
  has_many :teachers
end
