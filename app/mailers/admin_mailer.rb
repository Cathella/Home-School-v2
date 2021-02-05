class AdminMailer < ApplicationMailer
  default from: 'admin@homeschool.ug'

  def account_created_email()
    mail to: 'ncathie214@gmail.com', :subject => 'New user sign up!'
  end
end
