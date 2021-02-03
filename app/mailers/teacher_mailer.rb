class TeacherMailer < ApplicationMailer

  def forgot_password(teacher)
    @teacher = teacher
    @greeting = "Hi"

    mail to: teacher.email, :subject => "Reset password instructions"
  end
end
