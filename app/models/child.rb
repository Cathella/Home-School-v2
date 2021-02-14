class Child < ApplicationRecord
  before_create { generate_token(:auth_token) }
  before_create :confirmation_token

  has_secure_password

  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates :name, :length => { :minimum => 3, :maximum => 80 }
  validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  # validates :phone, :numericality => true, :length => { :minimum => 10, :maximum => 12 }
    
  has_one_attached :image, :dependent => :destroy
  
  belongs_to :group, optional: true
  has_one :address, :dependent => :destroy

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validates => false)
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    ChildMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Child.exists?(column => self[column])
  end

  private
    def confirmation_token
      if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
