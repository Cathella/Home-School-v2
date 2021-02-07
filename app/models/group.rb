class Group < ApplicationRecord
  validates_presence_of :name, :grade, :place, :program

  has_many :children
  has_many :teachers
end
