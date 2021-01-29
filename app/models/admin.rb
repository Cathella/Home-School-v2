class Admin < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  # validates :name, :presence => true, :length => { :minimum => 3, :maximum => 80 }
  # validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/

  # validates :email,
  # format: { with: /^(.+)@(.+)$/, message: "Email is Invalid"  },
  #           uniqueness: { case_sensitive: false },
  #           length: { minimum: 4, maximum: 254 }

  # validates_presence_of :email
  # validates :phone, :presence => true, :numericality => true, :length => { :minimum => 10, :maximum => 12 }
end
