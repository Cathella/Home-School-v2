class VideosController < ApplicationController
  before_action :set_video, only: [:show, :update, :destroy, :edit]

  def index
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.create video_params

    if @video.save
      redirect_to @video, notice: 'Video was created successfully.'
    else
      redirect_to new_video_path, notice: 'Try creating video again!'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def video_params
      params.require(:video).permit(:title, :youtube)
    end

    def set_video
      @video = Video.find(params[:id])
    end
end
