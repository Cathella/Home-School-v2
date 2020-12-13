class HomeController < ApplicationController
  def index
  end

  def myaddress
    @address = current_child.address
  end

  def teacheraddress
    @address = current_teacher.address
  end
end
