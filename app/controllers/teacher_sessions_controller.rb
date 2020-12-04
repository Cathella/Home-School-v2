class TeacherSessionsController < ApplicationController
  def new
  end

  def create
    teacher = Teacher.find_by_phone(params[:phone])
    if teacher && teacher.authenticate(params[:password])
      session[:teacher_id] = teacher.id
      redirect_to teacher, notice: "Teacher logged In!"
    else
      flash.now.alert = "Phone or password is invalid!"
      render "new"
    end
  end

  def destroy
    session[:teacher_id] = nil
    redirect_to teachershome_path, notice: "Teacher logged Out!"
  end
end