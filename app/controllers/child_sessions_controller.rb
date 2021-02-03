class ChildSessionsController < ApplicationController
  def new
  end

  def create
    child = Child.find_by_email(params[:email])
    if child && child.authenticate(params[:password])
      session[:child_id] = child.id
      redirect_to child, notice: "You have successfully logged In"
    else
      flash.now.alert = "Enter correct Email or Password!"
      render "new"
    end
  end

  def destroy
    session[:child_id] = nil
    redirect_to childrenhome_path, notice: "You have been logged out!"
  end
end
