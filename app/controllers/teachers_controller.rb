class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

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
    @teachers = Teacher.first(10)
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  def confirm_email
    teacher = Teacher.find_by_confirm_token(params[:id])
    if teacher
      teacher.email_activate
      flash[:success] = 'Your email has been verified 
      Please sign in to continue.'
      redirect_to new_teacher_session_path
    else
      flash[:error] = "Sorry, User does not exist"
      redirect_to root_url
    end
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.create(teacher_params)

    respond_to do |format|
      if @teacher.save
        TeacherMailer.registration_confirmation(@teacher).deliver
        AdminMailer.account_created_email.deliver
        format.html { redirect_to teachershome_path, notice: 'Teacher was successfully registered, Please check email to verify your account.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Your details have been updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.require(:teacher).permit(:name, :phone, :grade, :subject, :group_id, :password, :password_confirmation, :image, :email)
    end
end
