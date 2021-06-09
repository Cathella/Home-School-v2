class Children::AddressesController < ApplicationController
  before_action :set_child
  before_action :set_address, only: [:edit, :update]

  def new
    @address = Address.new
  end

  def create
    @address = @child.address.create address_params
    @address.child_id = current_child.id

    if @address.save
      redirect_to dashbord_path, notice: "Your Address has been saved!"
    else
      redirect_to new_child_address_path, notice: "Failed to save Address!"
    end
  end
  
  def edit  
  end
  
  def update
  end

  private

    def set_address
      @address = Address.find(params[:id])
    end

    def set_child
      @child = Child.find(params[:child_id])
    end

    def address_params
      params.require(:address).permit(:landmark, :longitude, :latitude)
    end
end
