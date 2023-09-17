class PhotosController < ApplicationController
  def top
  end
  
  def index
    @photo = Photo.new
    @photos =Photo.all
  end
  
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to @photo, notice: '投稿が作成されました。'
    else
      flash.now[:danger] = "投稿内容に不備があります。"
      render :new
    end
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  private

  def photo_params
    params.require(:photo).permit(:image, :title, :caption)
  end
end
