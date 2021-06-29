class HomeController < ApplicationController
  def index
  end

  def dashboard
  end

  def account
  end

  def upscale
    @videos = Video.all
  end
end
