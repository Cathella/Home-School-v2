class Teachers::DetailsController < ApplicationController
  before_action :set_teacher
  before_action :set_detail, only: [ :edit, :update ]

  def new
    @detail = Detail.new
  end
  
  def create
    @detail = @teacher.build_detail detail_params
    @detail.teacher_id = current_teacher.id

    if @detail.save
      redirect_to dashboard_path, notice: "Your profile has been saved"
    else
      redirect_to new_teacher_detail_path, notice: "Profile not saved. Try Again!"
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

    def set_detail
      @detail = Detail.find(params[:id])
    end
    
    def detail_params
      params.require(:detail).permit(:phone, :grade)
    end
end