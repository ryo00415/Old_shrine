class Public::PhotosController < ApplicationController
  before_action :authenticate_user! # ユーザーがログインしていることを確認

  load_and_authorize_resource # 認可を確認

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
      redirect_to photos_path(current_user), notice: '投稿が作成されました。'
    else
      flash.now[:danger] = "投稿内容に不備があります。"
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])

    # ユーザーが写真の所有者であることを確認する認可コードをここに追加

    if @photo.destroy
      redirect_to photos_path, notice: '写真が削除されました。'
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
