class TimelinesController < ApplicationController
  def index
    # タイムラインに表示するコンテンツを取得するロジックを記述
    @timeline_photos = Photo.all.order(created_at: :desc)  # 例: 投稿を新しい順に取得

    respond_to do |format|
      format.html
      format.json { render json: @timeline_photos }  # タイムラインデータをJSON形式で提供する場合
    end
  end
end
