class TeacherPasswordResetsController < ApplicationController
  def new
  end

  def create
    teacher = Teacher.find_by_email(params[:email])
    teacher.send_password_reset if teacher
    flash[:notice] = 'E-mail sent with password reset instructions.'
    redirect_to new_teacher_session_path
  end

  def edit
    @teacher = Teacher.find_by_password_reset_token!(params[:id])
  end

  def update
    @teacher = Teacher.find_by_password_reset_token!(params[:id])
    if @teacher.password_reset_sent_at < 2.hour.ago
      flash[:notice] = 'Password reset has expired'
      redirect_to new_teacher_password_reset_path
    elsif @teacher.update(teacher_params)
      flash[:notice] = 'Password has been reset!'
      redirect_to new_teacher_session_path
    else
      render :edit
    end
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:password)
    end
end
