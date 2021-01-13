class AdminMailer < ApplicationMailer
  default from: 'admin@homeschool.ug'

  def account_created_email
    # @admin = params[:admin]
    @url = 'https://shielded-brushlands-99997.herokuapp.com/admin_sessions/new'
    mail(to: 'ncathie214@gmail.com', subject: 'A new user has signed up!')
  end
end
