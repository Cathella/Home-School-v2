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

  def confirm_email
    child = Child.find_by_confirm_token(params[:id])
    if child
      child.email_activate
      flash[:success] = 'Your email has been verified 
      Please sign in to continue.'
      redirect_to new_child_session_path
    else
      flash[:error] = "Sorry, User does not exist"
      redirect_to root_url
    end
  end

  # POST /children
  # POST /children.json
  def create
    @child = Child.create(child_params)

    respond_to do |format|
      if @child.save
        ChildMailer.registration_confirmation(@child).deliver
        AdminMailer.account_created_email.deliver
        format.html { redirect_to childrenhome_path, notice: 'Child was successfully registered, Please check email to verify your account.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /children/1
  def update
    respond_to do |format|
      if @child.update(child_params)
        format.html { redirect_to @child, notice: 'Your profile has been updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /children/1
  def destroy
    @child.destroy
    respond_to do |format|
      format.html { redirect_to children_url, notice: 'Child was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def child_params
      params.require(:child).permit(:name, :phone, :grade, :program, :guardian, :password, :password_confirmation, :group_id, :image, :email)
    end
end
