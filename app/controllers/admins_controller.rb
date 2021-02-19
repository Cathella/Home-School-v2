class AdminsController < ApplicationController
  before_action :admin_authorize, only: [:index]

  def index
    @teacher_count = Teacher.all.size
    @child_count = Child.all.size
    @group_count = Group.all.size
    @user_count = @teacher_count + @child_count
    @ugrouped_child_count = Child.where(group_id: nil).size
    @ugrouped_teacher_count = Teacher.where(group_id: nil).size

    @teachers = Teacher.first(5)
    @children = Child.first(5)
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_path, notice: 'Account created!' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit(:name, :email, :phone, :password, :password_confirmation)
    end
end
