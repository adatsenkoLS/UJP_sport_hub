class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password) }
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    cookies.permanent[:locale] = params[:locale] if params[:locale].present?

    locale = cookies[:locale]&.to_sym
    I18n.locale = locale if I18n.available_locales.include?(locale)
  end
end
