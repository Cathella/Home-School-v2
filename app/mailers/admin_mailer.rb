class AdminMailer < ApplicationMailer
  default from: 'admin@homeschool.ug'
  
  def account_created_email
    mail(to: 'homeschoolug@gmail.com', subject: 'A new user has signed up!')
  end
end
