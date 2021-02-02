# Preview all emails at http://localhost:3000/rails/mailers/child_mailer
class ChildMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/child_mailer/password_reset
  def password_reset
    ChildMailer.password_reset
  end

end
