class Teacher < ApplicationRecord
  has_secure_password

  validates_presence_of :phone, :name
  validates_uniqueness_of :phone

  belongs_to :group, optional: true
  has_one :address, :dependent => :destroy
end
