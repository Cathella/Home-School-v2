class HomeController < ApplicationController
  def index
  end

  def myaddress
    @address = current_child.address
  end

  def teacheraddress
    @direction = current_teacher.direction
  end

  def mygroup
    @group = current_child.group
  end

  def teachergroup
    @group = current_teacher.group
  end

  def joined
  end

  def lessons
  end

  def privateaching
  end

  def account; end
end
