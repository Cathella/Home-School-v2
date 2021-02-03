class PasswordResetsController < ApplicationController
  def new
  end

  def create
    child = Child.find_by_email(params[:email])
    child.send_password_reset if child
    flash[:notice] = 'E-mail sent with password reset instructions.'
    redirect_to new_child_session_path
  end

  def edit
    @child = Child.find_by_password_reset_token!(params[:id])
  end

  def update
    @child = Child.find_by_password_reset_token!(params[:id])
    if @child.password_reset_sent_at < 2.hour.ago
      flash[:notice] = 'Password reset has expired'
      redirect_to new_password_reset_path
    elsif @child.update(child_params)
      flash[:notice] = 'Password has been reset!'
      redirect_to new_child_session_path
    else
      render :edit
    end
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def child_params
      params.require(:child).permit(:password)
    end
end
