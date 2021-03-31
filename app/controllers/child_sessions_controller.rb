class ChildSessionsController < ApplicationController
  def new
  end

  def create
    child = Child.find_by_email(params[:email])
    if child && child.authenticate(params[:password])
      if child.email_confirmed  
        session[:child_id] = child.id
        redirect_to child, notice: "You have successfully logged In"
      else
        flash.now.alert = "Please activate your account by following the 
        instructions in the account confirmation email you received to login."
        render "new"
      end
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
