class ChildMailer < ApplicationMailer
  def password_reset(child)
    @child = child
    @greeting = "Hi"

    mail to: @child.email, :subject => 'Reset password instructions'
  end
end
