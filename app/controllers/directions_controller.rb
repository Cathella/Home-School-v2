class DirectionsController < ApplicationController
  before_action :set_direction, only: [:show, :edit, :update, :destroy]
  before_action :admin_authorize, only: [:index, :show]
  before_action :teacher_authorize, only: [:edit, :update]

  # GET /directions
  # GET /directions.json
  def index
    @directions = Direction.all
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

  # GET /directions/1
  # GET /directions/1.json
  def show
    origin = [@direction.latitude, @direction.longitude]
    @destination = Direction.get_lat_lon_array
    @distances = @destination.map { |point| haversine_distance(point, origin).to_i }
  end

  # GET /directions/new
  def new
    @direction = Direction.new
  end

  # GET /directions/1/edit
  def edit
  end

  # POST /directions
  # POST /directions.json
  def create
    @direction = Direction.new(direction_params)
    @direction.teacher_id = current_teacher.id

    respond_to do |format|
      if @direction.save
        format.html { redirect_to teacher_address_path, notice: 'Your Address was successfully added.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /directions/1
  # PATCH/PUT /directions/1.json
  def update
    respond_to do |format|
      if @direction.update(direction_params)
        format.html { redirect_to @direction, notice: 'Your Address was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /directions/1
  # DELETE /directions/1.json
  def destroy
    @direction.destroy
    respond_to do |format|
      format.html { redirect_to directions_url, notice: 'Direction was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direction
      @direction = Direction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def direction_params
      params.require(:direction).permit(:landmark, :longitude, :latitude)
    end
end
