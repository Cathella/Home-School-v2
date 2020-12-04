class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  # GET /children
  # GET /children.json
  def index
    @children = Child.all
  end

  # GET /children/1
  # GET /children/1.json
  def show
  end

  def childrenhome
  end

  # GET /children/new
  def new
    @child = Child.new
  end

  # GET /children/1/edit
  def edit
  end

  # POST /children
  # POST /children.json
  def create
    # @child = Child.new(child_params)

    child = Child.create!(
      name: params['child']['name'],
      phone: params['child']['phone'],
      grade: params['child']['grade'],
      subject: params['child']['guardian'],
      address: params['child']['address'],
      password: params['child']['password'],
      password_confirmation: params['child']['password_confirmation']
    )

    respond_to do |format|
      if child.save
        format.html { redirect_to childrenhome_path, notice: 'Student was successfully registered!' }
        # format.json { render :show, status: :created, location: @child }
      else
        format.html { render :new }
        # format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /children/1
  # PATCH/PUT /children/1.json
  def update
    respond_to do |format|
      if @child.update(child_params)
        format.html { redirect_to @child, notice: 'Child was successfully updated.' }
        # format.json { render :show, status: :ok, location: @child }
      else
        format.html { render :edit }
        # format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /children/1
  # DELETE /children/1.json
  def destroy
    @child.destroy
    respond_to do |format|
      format.html { redirect_to children_url, notice: 'Child was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def child_params
      params.require(:child).permit(:name, :phone, :grade, :guardian, :address, :password, :password_confirmation)
    end
end
