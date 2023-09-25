class Public::TimelinesController < ApplicationController
  def index
    # タイムラインに表示するコンテンツを取得するロジックを記述
    @timeline_photos = Photo.order(created_at: :desc).page(params[:page]).per(8)

    respond_to do |format|
      format.html
      format.json { render json: @timeline_photos }  # タイムラインデータをJSON形式で提供する場合
    end
  end
end
