class User::SearchesController < ApplicationController
  def search
    @query = params[:q]
    # 検索処理を実装
    # 検索結果をインスタンス変数に格納
  end
end
