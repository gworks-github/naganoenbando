class ApplicationController < ActionController::Base

  #devise
  before_action :configure_permitted_parameters, if: :devise_controller?

	def idex
	end

  protected
  #devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_furigana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_furigana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:post_code])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end


end
