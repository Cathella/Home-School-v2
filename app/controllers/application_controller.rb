class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_teacher
    @current_teacher ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
  end
  
  helper_method :current_teacher

  def current_child
    @current_child ||= Child.find(session[:child_id]) if session[:child_id]
  end
  
  helper_method :current_child

  def teacher_authorize
    redirect_to new_teacher_session_path, notice: 'You are not authorized!' if current_teacher.nil?
  end

  def child_authorize
    redirect_to new_child_session_path, notice: 'You are not authorized!' if current_child.nil?
  end
end
