# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  layout 'login_layout'

  # before_action :configure_sign_in_params, only: [:create]

  def new
    super
  end


  def subscribe_email
    super
  end



  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    reset_session
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
