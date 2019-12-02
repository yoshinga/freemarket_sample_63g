class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, kyes: [:nickname, :telephone_number, :family_name, :first_name, :family_kana_name, :first_kana_name, :card_number, :month, :year, :code_number, address_attributes: [:postal_code, :prefecture, :city, :house_number, :building_name]])
    devise_parameter_sanitizer.permit(:account_update, kyes: [:nickname, :telephone_number, :family_name, :first_name, :family_kana_name, :first_kana_name, :card_number, :month, :year, :code_number, address_attributes: [:postal_code, :prefecture, :city, :house_number, :building_name]])
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
