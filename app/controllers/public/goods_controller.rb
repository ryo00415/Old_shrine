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
      # いいねが成功した場合の処理
      redirect_to @photo, notice: 'いいねしました。'
    else
      # エラーが発生した場合の処理
      redirect_to @photo, alert: 'いいねに失敗しました。'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @good = current_user.goods.find_by(photo: @photo)
    if @good.destroy
      # いいねの削除が成功した場合の処理
      redirect_to @photo, notice: 'いいねを取り消しました。'
    else
      # エラーが発生した場合の処理
      redirect_to @photo, alert: 'いいねの取り消しに失敗しました。'
    end
  end
end
