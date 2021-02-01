class PasswordResetsController < ApplicationController
  def new
  end

  def create
    child = Child.find_by_phone(params[:phone])
    child.send_password_reset if child
    flash[:notice] = 'A reset code has been sent to your phone number.'
    redirect_to new_child_session_path
  end
end
