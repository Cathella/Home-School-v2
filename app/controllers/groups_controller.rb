class GroupsController < ApplicationController
  before_action :set_group, only: [ :edit, :update, :show ]

  def index
    # @groups = Group.all
    @q = Group.search(params[:q])
    @groups = @q.result(distinct: true)
  end

  def new
    @group = Group.new
    @group_name = current_teacher.full_name.parameterize(separator: '-') + "-study-group"
  end

  def show
  end

  def create
    @group = Group.create group_params
    @group.teacher_id = current_teacher.id

    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
      redirect_to new_group_path, notice: "Group not created. Try Again!"
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :subject, :grade)
    end
end