class Public::PhotosController < ApplicationController
  before_action :authenticate_user! # ユーザーがログインしていることを確認
  load_and_authorize_resource # 認可を確認

  def top
  end

  def index
    @user = User.find(params[:user_id])
    @photo = Photo.new
    @photos =@user.photos
  end

  def new
    @user = User.find(params[:user_id])
    @photo = @user.photos.build
  end

  def create
    @user = User.find(params[:user_id])
    @photo = @user.photos.build(photo_params)
    if @photo.save
      redirect_to user_photos_path(@user), notice: '投稿が作成されました。'
    else
      flash.now[:danger] = "投稿内容に不備があります。"
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @photo = @user.photos.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @photo = @user.photos.find(params[:id])

    if @photo.destroy
      redirect_to user_photos_path(@user), notice: '写真が削除されました。'
    else
      flash.now[:danger] = '写真の削除に失敗しました。'
      render :show
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :title, :caption)
  end
end
