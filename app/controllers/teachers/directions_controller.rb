class Teachers::DirectionsController < ApplicationController
  before_action :set_teacher
  before_action :set_direction, only: [ :edit, :update ]

  def new
    @direction = Direction.new
  end
  
  def create
    @direction = @teacher.build_direction direction_params
    @direction.teacher_id = current_teacher.id

    if @direction.save
      redirect_to dashboard_path, notice: 'Your Address has been saved!'
    else
      redirect_to new_teacher_direction_path, notice: "Failed to save Address!"
    end
  end

  def edit
  end

  def update
  end

  private
    def set_teacher
      @teacher = Teacher.find(params[:teacher_id])
    end

    def set_direction
      @direction = Direction.find(params[:id])
    end

    def direction_params
      params.require(:direction).permit(:landmark, :latitude, :longitude)
    end
end
