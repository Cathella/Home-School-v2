class Teacher < ApplicationRecord
  # before_create { generate_token(:auth_token) }
  
  has_secure_password

  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates :name, :length => { :minimum => 3, :maximum => 80 }
  validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  # validates :phone, :numericality => true, :length => { :minimum => 10, :maximum => 12 }
    
  has_one_attached :image, :dependent => :destroy

  belongs_to :group, optional: true
  has_one :direction, :dependent => :destroy

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    TeacherMailer.forgot_password(self).deliver
  end

  # This sends an e-mail with a link for the user to reset the password
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Teacher.exists?(column => self[column])
  end
end
