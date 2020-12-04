class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :ateacher_authorize, only: [:edit, :update, :index]

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  def teachershome
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create
    # @teacher = Teacher.new(teacher_params)

    teacher = Teacher.create!(
      name: params['teacher']['name'],
      phone: params['teacher']['phone'],
      grade: params['teacher']['grade'],
      subject: params['teacher']['subject'],
      address: params['teacher']['address'],
      password: params['teacher']['password'],
      password_confirmation: params['teacher']['password_confirmation']
    )

    respond_to do |format|
      if teacher.save
        format.html { redirect_to teachershome_path, notice: 'Thank you for signing up! Please continue to Log In' }
        # format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        # format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        # format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        # format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.require(:teacher).permit(:name, :phone, :grade, :subject, :address, :password, :password_confirmation)
    end
end
