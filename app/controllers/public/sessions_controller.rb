class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  # 退会しているかを判断するメソッド
  def customer_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @userr = User.find_by(email: params[:user][:email])
      ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@userr
      ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @user.valid_password?(params[:user][:password])
    ## 【処理内容3】
      if @user.is_deleted
      # 退会していた場合の処理をここに記述
      # 例えば、エラーメッセージを設定して退会済みユーザーに通知するなどの処理を追加
      flash[:notice] = "退会済みのアカウントです。"
      redirect_to root_path # 退会済みの場合、リダイレクトなどの適切な処理を行う
      else
      # 退会していない場合の処理を実行
      # 例えば、ログイン処理を実行したり、他の処理を記述
      end
    else
      # パスワードが一致しない場合の処理を実装
      # 例えば、エラーメッセージを設定してユーザーに通知するなどの処理を追加
      flash[:alert] = "パスワードが正しくありません。"
      redirect_to login_path # パスワードが正しくない場合、リダイレクトなどの適切な処理を行う
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end