class DirectionsController < ApplicationController
  before_action :set_direction, only: [ :edit, :update ]

  def new
    @direction = Direction.new
  end
  
  def create
    @direction = Direction.create direction_params
    @direction.teacher_id = current_teacher.id

    if @direction.save
      redirect_to dashboard_path, notice: 'Your Address has been saved!'
    else
      redirect_to new_direction_path, notice: "Failed to save Address!"
    end
  end

  def edit
  end

  def update
    if @direction.update(direction_params)
      redirect_to dashboard_path, notice: "Your Address has been Updated!"
    else
      redirect_to dashboard_path, notice: "Failed to Update Address!"
    end
  end

  private
    def set_direction
      @direction = Direction.find(params[:id])
    end

    def direction_params
      params.require(:direction).permit(:landmark, :longitude, :latitude)
    end
end
