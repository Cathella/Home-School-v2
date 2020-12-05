class AdminSessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by_email(params[:email])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin, notice: "Admin logged in"
    else
      flash.now.alert = "Email or password is invalid!"
      render "new"
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_url, notice: "Admin logged out!"
  end
end
