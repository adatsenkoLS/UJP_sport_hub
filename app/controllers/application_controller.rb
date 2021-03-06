class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  skip_before_action :verify_authenticity_token

  protected

  def authenticate_admin!
    authenticate_user!
    redirect_to root_path, status: :forbidden unless current_user.admin?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password) }
  end

  private

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    cookies.permanent[:locale] = params[:locale] if params[:locale].present?

    locale = cookies[:locale]&.to_sym
    I18n.locale = locale if I18n.available_locales.include?(locale)
  end
end
