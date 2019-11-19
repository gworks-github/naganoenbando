class ApplicationController < ActionController::Base

  #devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  #ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_items_path
    when Customer
      root_path
    end
  end

	def idex
	end

  protected
  #devise
  def configure_permitted_parameters
    #会員登録
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_furigana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_furigana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:post_code])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    #管理者登録用
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #情報編集
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_furigana])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_furigana])
    devise_parameter_sanitizer.permit(:account_update, keys: [:post_code])
    devise_parameter_sanitizer.permit(:account_update, keys: [:address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
    #管理者情報用
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end
