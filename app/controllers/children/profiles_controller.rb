class Children::ProfilesController < ApplicationController
  before_action :set_child
  before_action :set_profile, only: [ :edit, :update ]

  def new
    @profile = Profile.new
  end

  def create
    @profile = @child.build_profile profile_params
    @profile.child_id = current_child.id

    if @profile.save
      redirect_to dashboard_path, notice: 'Your profile has been saved'
    else
      redirect_to new_child_profile_path, notice: 'Profile not saved. Try Again!'
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
    
    def set_child
      @child = Child.find(params[:child_id])
    end
end
