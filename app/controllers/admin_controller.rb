class AdminController < ApplicationController
  before_action :admin_authorize, only: [:index]

  def index
    @teacher_count = Teacher.all.size
    @child_count = Child.all.size
    @group_count = Group.all.size
    @user_count = @teacher_count + @child_count
    @ugrouped_child_count = Child.where(group_id: nil).size
    @ugrouped_teacher_count = Teacher.where(group_id: nil).size
  end
end
