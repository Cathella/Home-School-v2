class TeacherSessionsController < ApplicationController
  def new
  end

  def create
    teacher = Teacher.find_by_email(params[:email])
    if teacher && teacher.authenticate(params[:password])
      if teacher.email_confirmed
        session[:teacher_id] = teacher.id
        redirect_to teacher, notice: "You have successfully logged In!"
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
    session[:teacher_id] = nil
    redirect_to teachershome_path, notice: "You have been logged Out!"
  end
end
