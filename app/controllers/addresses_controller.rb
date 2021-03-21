class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :admin_authorize, only: [:index, :show]
  before_action :child_authorize, only: [:edit, :update]

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  def haversine_distance(geo_a, geo_b, miles=false)
    # Get latitude and longitude
    lat1, lon1 = geo_a
    lat2, lon2 = geo_b
  
    # Calculate radial arcs for latitude and longitude
    dLat = (lat2 - lat1) * Math::PI / 180
    dLon = (lon2 - lon1) * Math::PI / 180
  
    a = Math.sin(dLat / 2) * 
        Math.sin(dLat / 2) +
        Math.cos(lat1 * Math::PI / 180) * 
        Math.cos(lat2 * Math::PI / 180) *
        Math.sin(dLon / 2) * Math.sin(dLon / 2)
  
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    
    d = 6371 * 1000 * c # in meters
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
    origin = [@address.latitude, @address.longitude]
    @destination = Address.get_lat_lon_array
    @distances = @destination.map { |point| haversine_distance(point, origin).to_i }
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)
    @address.child_id = current_child.id

    respond_to do |format|
      if @address.save
        format.html { redirect_to my_address_path, notice: 'Your Address was successfully added.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Your Address was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully removed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:landmark, :longitude, :latitude)
    end
end
