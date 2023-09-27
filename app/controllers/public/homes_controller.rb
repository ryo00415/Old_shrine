class Public::HomesController < ApplicationController
  def top
    # ログインしているかどうかに関係なく、タイムライン上の写真を取得する
    @timeline_photos = Photo.order(created_at: :desc).page(params[:page]).per(8)

    if user_signed_in?
      # ログインしている場合の処理
      # 必要に応じて他のロジックや変数の設定を行う
    else
      # ログインしていない場合の処理
      # 代替のコンテンツを表示するか、何もしないか、必要に応じて実装
      @alternative_content = "ログインしていません。ログインまたは新規登録をしてください。"
    end

    # ビューに渡すデータを設定する
    @some_other_variable = Time.now

    # ビューを描画する
    render "top"
  end
end

