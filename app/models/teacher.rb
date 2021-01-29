class Teacher < ApplicationRecord
  has_secure_password

  validates_presence_of :phone, :name
  validates_uniqueness_of :phone

  has_one_attached :image, :dependent => :destroy

  belongs_to :group, optional: true
  has_one :direction, :dependent => :destroy

  # validates :name, :presence => true, :length => { :minimum => 3, :maximum => 80 }
  # validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  # validates_uniqueness_of :phone
  # validates :phone, :presence => true, :numericality => true, :length => { :minimum => 10, :maximum => 12 }

  # has_one_attached :image, :dependent => :destroy

  # belongs_to :group, optional: true
  # has_one :direction, :dependent => :destroy
end
