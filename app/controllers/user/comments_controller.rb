class CommentsController < ApplicationController
  before_action :authenticate_user! # ユーザーがログインしているか確認
  
  def create
    @photo = Photo.find(params[:photo_id]) # 対象の写真を取得
    @comment = @photo.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.html { redirect_to @photo, notice: 'コメントが投稿されました' }
        format.js   # コメントを非同期で追加するためにJavaScriptを返す
      end
    else
      # エラー処理
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @photo = @comment.photo
    if @comment.user == current_user
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to @photo, notice: 'コメントが削除されました' }
        format.js   # コメントを非同期で削除するためにJavaScriptを返す
      end
    else
      # 権限がない場合のエラー処理
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:caption)
  end
end
