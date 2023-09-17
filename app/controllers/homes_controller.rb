class HomesController < ApplicationController
  def top
    # タイムライン上の投稿を取得するクエリを追加する
    # 例: 最新の投稿を取得する場合、投稿モデルから最新の投稿を取得するコードを記述
    @timeline_photos = Photo.order(created_at: :desc).limit(10)

    # 他の必要なロジックや変数の設定を行う

    # ビューに渡すデータを設定する
    # この行は必要に応じて変更してください
    @some_other_variable = "Some data"

    # ビューを描画する
    render "top"
  end
end
