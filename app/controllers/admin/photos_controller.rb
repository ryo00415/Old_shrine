class Admin::PhotosController < ApplicationController
  before_action :authenticate_admin! # ユーザーがログインしていることを確認
  load_and_authorize_resource :user
  load_and_authorize_resource :photo, through: :user # 認可を確認

  def index
    @photos = @user.photos.page(params[:page]).per(6) # 1ページあたり6件表示
  end

  def show
    # CanCanCanがすでに@photoを設定しているため、何もしない
  end

  def destroy
    if @photo.destroy
      redirect_to admin_user_photos_path(@user), notice: '写真が削除されました。'
    else
      flash.now[:danger] = '写真の削除に失敗しました。'
      render :show
    end
  end
end

