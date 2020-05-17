class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
<<<<<<< Updated upstream
=======
  before_action :set_category
  before_action :configure_permitted_parameters, if: :devise_controller?
>>>>>>> Stashed changes
  protect_from_forgery with: :exception

  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday]) 
  end


  private

  def production?
    Rails.env.production?
  end


  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
<<<<<<< Updated upstream
=======

  protected
  def set_category
    @parents  = Category.where(ancestry: nil)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday]) 
  end

>>>>>>> Stashed changes
end