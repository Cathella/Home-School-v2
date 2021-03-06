class ProfilesController < ApplicationController
  before_action :set_profile, only: [ :edit, :update ]
  before_action :authenticate_child!

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create profile_params
    @profile.child_id = current_child.id

    if @profile.save
      redirect_to dashboard_path, notice: 'Your profile has been saved'
    else
      redirect_to new_profile_path, notice: 'Profile not saved. Try Again!'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  private

    def set_profile
      @profile = Profile.find(params[:id])
    end
    
    def profile_params
      params.require(:profile).permit(:phone, :grade)
    end
end
