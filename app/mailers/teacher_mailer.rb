class TeacherMailer < ApplicationMailer

  def forgot_password(teacher)
    @teacher = teacher
    @greeting = "Hi"

    mail to: teacher.email, :subject => "Reset password instructions"
  end

  def registration_confirmation(teacher)
    @teacher = teacher
    @greeting = "Hi"

    mail to: teacher.email, :subject => "Registration Confirmation"
  end
end
