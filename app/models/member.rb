class Member < ApplicationRecord
  validates :child_id, uniqueness: { scope: :group_id }
  
  belongs_to :child
  belongs_to :group
end
