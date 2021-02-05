class ChildMailer < ApplicationMailer
  def password_reset(child)
    @child = child
    @greeting = "Hi"

    mail to: @child.email, :subject => 'Reset password instructions'
  end

  def registration_confirmation(child)
    @child = child

    mail to: child.email, :subject => "Registration Confirmation"
  end
end
