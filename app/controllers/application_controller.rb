class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana])
  end

  def after_sign_in_path_for(resource)
    if resource.deleted?
      sign_out resource
      flash[:alert] = "このアカウントは削除されました"
      new_user_session_path
    else
      super
    end
  end
end