class Public::SearchesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def search
    @query = params[:q]
    # 検索処理を実装
    @results = User.where('name LIKE ?', "%#{@query}%")
    # 検索結果をインスタンス変数に格納
  end
end

