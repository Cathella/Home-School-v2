class AddressesController < ApplicationController
  before_action :set_address, only: [ :edit, :update ]

  def new
    @address = Address.new
  end

  def create
    @address = Address.create address_params
    @address.child_id = current_child.id

    if @address.save
      redirect_to dashboard_path, notice: "Your Address has been saved!"
    else
      redirect_to new_address_path, notice: "Failed to save Address!"
    end
  end
  
  def edit  
  end
  
  def update
    if @address.update(address_params)
      redirect_to dashboard_path, notice: "Your Address has been Updated!"
    else
      redirect_to dashboard_path, notice: "Failed to Update Address!"
    end
  end

  private

    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:landmark)
    end
end
