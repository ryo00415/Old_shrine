class GoodsController < ApplicationController
  before_action :authenticate_user! # ログインが必要な場合
  
  def index
  end
  
  def create
    @photo = Photo.find(params[:id])
    @good = current_user.likes.build(photo: @photo)
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
    @good = current_user.likes.find_by(photo: @photo)
    if @good.destroy
      # いいねの削除が成功した場合の処理
      redirect_to @photo, notice: 'いいねを取り消しました。'
    else
      # エラーが発生した場合の処理
      redirect_to @photo, alert: 'いいねの取り消しに失敗しました。'
    end
  end
end
