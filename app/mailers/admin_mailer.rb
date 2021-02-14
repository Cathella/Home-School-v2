class AdminMailer < ApplicationMailer
  default from: 'admin@homeschool.ug'

<<<<<<< HEAD
  def account_created_email
    mail(to: 'homeschoolug@gmail.com', subject: 'A new user has signed up!')
=======
  def account_created_email()
    mail to: 'ncathie214@gmail.com', :subject => 'New user sign up!'
>>>>>>> f1c8b54eca8acb461e97608a7120b4d643666e99
  end
end
