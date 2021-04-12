class Post < ApplicationRecord
  validates_presence_of :description, :subject, :grade, :budget, :commitment, :per_payment

  belongs_to :child, optional: true
  has_rich_text :description
end
