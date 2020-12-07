class ChildSessionsController < ApplicationController
  def new
  end

  def create
    child = Child.find_by_phone(params[:phone])
    if child && child.authenticate(params[:password])
      session[:child_id] = child.id
      redirect_to child, notice: "Child logged in"
    else
      flash.now.alert = "Phone or password is invalid!"
      render "new"
    end
  end

  def destroy
    session[:child_id] = nil
    redirect_to childrenhome_path, notice: "Child logged out!"
  end
end
