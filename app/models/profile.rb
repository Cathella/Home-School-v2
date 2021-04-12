class Profile < ApplicationRecord
  validates_presence_of :per_charge, :fee, :experience, :commitment, :description

  belongs_to :teacher, optional: true
  has_rich_text :description
end
