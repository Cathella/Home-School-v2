class Admin < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :email, :phone
  validates_uniqueness_of :email
end
