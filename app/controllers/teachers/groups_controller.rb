class Teachers::GroupsController < ApplicationController
  before_action :set_teacher
  before_action :set_group, only: [ :edit, :update ]

  def new
    @group = Group.new
  end

  def create
    @group = @teacher.groups.new group_params
    @group.teacher_id = current_teacher.id
  end

  private
    def set_teacher
      @teacher = Teacher.find(params[:teacher_id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    def group_params
      params.require(:group).permit(:name, :subject)
    end
end