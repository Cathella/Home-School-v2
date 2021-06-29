class VideosController < ApplicationController
  before_action :set_video, only: [:show, :update, :destroy, :edit]
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @videos = Video.all
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
    if @video.update(video_params)
      redirect_to @video, notice: 'Video was updated successfully'
    else
      redirect_to @video, notice: 'Unable to update video!'
    end
  end

  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_path, notice: 'Video has been deleted!' }
    end
  end

  private

    def video_params
      params.require(:video).permit(:title, :youtube)
    end

    def set_video
      @video = Video.find(params[:id])
    end
end
