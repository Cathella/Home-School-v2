class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_teacher
    @current_teacher ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
  end
  
  helper_method :current_teacher

  def authorize
    redirect_to new_teacher_session_path, notice: 'You are not authorized!' if current_teacher.nil?
  end
end
