class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  # before_action :configure_sign_up_params, only: [:create]

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nikname])
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:nikname,:email, :encrypted_password])
  end
end
