class DetailsController < ApplicationController
  before_action :set_detail, only: [ :edit, :update ]
  before_action :authenticate_teacher!

  def new
    @detail = Detail.new
  end
  
  def create
    @detail = Detail.create detail_params
    @detail.teacher_id = current_teacher.id

    if @detail.save
      redirect_to dashboard_path, notice: "Your profile has been saved"
    else
      redirect_to new_detail_path, notice: "Profile not saved. Try Again!"
    end
  end
  
  def edit
  end

  def update
  end

  private
    def set_detail
      @detail = Detail.find(params[:id])
    end
    
    def detail_params
      params.require(:detail).permit(:phone)
    end
end