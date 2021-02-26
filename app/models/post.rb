class Post < ApplicationRecord
  validates_presence_of :description, :subject, :grade, :budget, :commitment, :per_payment
end
