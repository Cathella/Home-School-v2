class Member < ApplicationRecord
  belongs_to :child
  belongs_to :group
end
