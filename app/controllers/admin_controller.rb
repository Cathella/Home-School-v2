class AdminController < ApplicationController
  before_action :admin_authorize, only: [:index]

  def index
    @teachers = Teacher.all
    @children = Child.all
  end
end
