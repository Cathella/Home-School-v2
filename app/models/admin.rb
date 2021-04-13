class Admin < ApplicationRecord
  has_secure_password
  denshobato_for :teacher

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  # validates :email,
  # format: { with: /^(.+)@(.+)$/, message: "Email is Invalid"  },
            # uniqueness: { case_sensitive: false },
            # length: { minimum: 4, maximum: 254 }
end
