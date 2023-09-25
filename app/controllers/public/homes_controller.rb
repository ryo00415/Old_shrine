class Public::HomesController < ApplicationController
  def top
    if user_signed_in?
      # ログインしている場合の処理
      # タイムライン上の写真を取得するクエリを追加する
      @timeline_photos = Photo.order(created_at: :desc).page(params[:page]).per(8)
    else
      # ログインしていない場合の処理
      # 代替のコンテンツを表示するか、何もしないか、必要に応じて実装
      # 以下は例ですが、適切なコンテンツに変更してください
      @alternative_content = "ログインしていません。ログインまたは新規登録をしてください。"
    end

    # 他の必要なロジックや変数の設定を行う

    # ビューに渡すデータを設定する
    # この行は必要に応じて変更してください
    @some_other_variable = Time.now

    # ビューを描画する
    render "top"
  end
end
