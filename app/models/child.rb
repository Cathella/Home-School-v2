class Child < ApplicationRecord
  has_secure_password

  validates_presence_of :phone, :name
  validates_uniqueness_of :phone
end
