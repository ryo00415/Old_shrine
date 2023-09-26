class Admin::PhotosController < ApplicationController
  before_action :authenticate_admin! # ユーザーがログインしていることを確認
  load_and_authorize_resource # 認可を確認

  def index
    @user = User.find(params[:user_id])
    @photo = Photo.new
    @photos = @user.photos.page(params[:page]).per(6) # 1ページあたり6件表示
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
end
