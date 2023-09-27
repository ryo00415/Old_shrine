class Public::UsersController < ApplicationController

  def show
    if params[:id].to_i.to_s == params[:id]
    @user = User.find(params[:id])
    else
    @user = current_user
    end
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  def confirm_withdraw
    @user = current_user
  end

  def withdraw
    @user = User.find(current_user.id)
    # ユーザーのいいねを全て削除
    @user.goods.destroy_all
    # ユーザーのコメントを全て削除
    @user.comments.destroy_all
    # ユーザーの写真を全て削除
    @user.photos.destroy_all
    # ユーザーを論理的に削除（物理的には削除しない）
    @user.update(deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :name_kana, :email, )
  end
end
