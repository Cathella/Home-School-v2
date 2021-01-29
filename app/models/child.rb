class Child < ApplicationRecord
  has_secure_password

  validates_presence_of :name
  validates_uniqueness_of :phone
  validates :phone, :presence => true, :numericality => true, :length => { :minimum => 10, :maximum => 12 }

  has_one_attached :image, :dependent => :destroy
  
  belongs_to :group, optional: true
  has_one :address, :dependent => :destroy
end
