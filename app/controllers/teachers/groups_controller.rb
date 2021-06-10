class Teachers::GroupsController < ApplicationController
  before_action :set_teacher
  before_action :set_group, only: [ :edit, :update, :show ]

  def index
    @groups = current_teacher.groups
  end

  def new
    @group = Group.new
    # @value = 5.times.map { (0...(rand(10))).map { ('a'..'z').to_a[rand(26)] }.join }.join(" ")
    @group_name = current_teacher.full_name.parameterize(separator: '-') + "-study-group"
  end

  def show
  end

  def create
    @group = @teacher.groups.new group_params
    @group.teacher_id = current_teacher.id

    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
      redirect_to new_teacher_group_path, notice: "Group not created. Try Again!"
    end
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