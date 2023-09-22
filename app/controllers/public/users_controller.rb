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
    redirect_to users_path(current_user.id)
  end

  def confirm_withdraw
    @user = current_user
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
end
