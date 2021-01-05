class Teacher < ApplicationRecord
  has_secure_password

  validates_presence_of :phone, :name
  validates_uniqueness_of :phone

  has_one_attached :image, :dependent => :destroy

  belongs_to :group, optional: true
  has_one :direction, :dependent => :destroy
end
