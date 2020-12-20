class DirectionsController < ApplicationController
  before_action :set_direction, only: [:show, :edit, :update, :destroy]

  # GET /directions
  # GET /directions.json
  def index
    @directions = Direction.all
  end

  # GET /directions/1
  # GET /directions/1.json
  def show
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

    respond_to do |format|
      if @direction.save
        format.html { redirect_to @direction, notice: 'Direction was successfully created.' }
        format.json { render :show, status: :created, location: @direction }
      else
        format.html { render :new }
        format.json { render json: @direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /directions/1
  # PATCH/PUT /directions/1.json
  def update
    respond_to do |format|
      if @direction.update(direction_params)
        format.html { redirect_to @direction, notice: 'Direction was successfully updated.' }
        format.json { render :show, status: :ok, location: @direction }
      else
        format.html { render :edit }
        format.json { render json: @direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directions/1
  # DELETE /directions/1.json
  def destroy
    @direction.destroy
    respond_to do |format|
      format.html { redirect_to directions_url, notice: 'Direction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direction
      @direction = Direction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def direction_params
      params.fetch(:direction, {})
    end
end
