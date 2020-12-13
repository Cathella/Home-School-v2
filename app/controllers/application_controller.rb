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

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  
  helper_method :current_admin

  def teacher_authorize
    redirect_to new_teacher_session_path, notice: 'You are not authorized!' if current_teacher.nil?
  end

  def child_authorize
    redirect_to new_child_session_path, notice: 'You are not authorized!' if current_child.nil?
  end

  def admin_authorize
    redirect_to new_admin_session_path, notice: 'You are not authorized!' if current_admin.nil?
  end

  def group_add
    if @group
      @group_add ||= Group.exists?
    else
      @group_add = nil
    end
  end

  helper_method :group_add

  def address_add
    if @address
      @address_add ||= Address.exists?
    else
      @address_add = nil
    end
  end

  helper_method :address_add

  
end
