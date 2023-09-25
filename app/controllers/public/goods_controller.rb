class Public::GoodsController < ApplicationController
  before_action :authenticate_user! # ログインが必要な場合

  def index
    @user = User.find_by(id: params[:userid])
    if @user.nil?
      # ユーザーが見つからない場合の処理
      redirect_to root_path, alert: 'ユーザーが見つかりませんでした。'
    else
      @goods = @user.goods.includes(:photo) # ユーザーが行ったいいね一覧を取得
    end
  end

  def create
    @photo = Photo.find(params[:id])
    @good = current_user.goods.build(photo: @photo)
    if @good.save
      respond_to do |format|
      format.html { redirect_to user_photo_path(current_user, @photo), notice: 'いいねしました。' }
      format.js
      end
    else
      respond_to do |format|
      format.html { redirect_to user_photo_path(current_user, @photo), alert: 'いいねに失敗しました。' }
      format.js
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @good = current_user.goods.find_by(photo: @photo)
    if @good && @good.destroy
      respond_to do |format|
      format.html { redirect_to user_photo_path(current_user, @photo), notice: 'いいねを取り消しました。' }
      format.js
    end
  else
      respond_to do |format|
      format.html { redirect_to user_photo_path(current_user, @photo), alert: 'いいねの取り消しに失敗しました。' }
      format.js
    end
   end
  end
end