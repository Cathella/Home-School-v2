class Admin < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates :phone, :presence => true, :numericality => true, :length => { :minimum => 10, :maximum => 12 }
end
