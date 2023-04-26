# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  before_action :skip_verify_authorized!
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    # TODO: find a better way to clear cache
    Rails.cache.clear
    super
  end

  # DELETE /resource/sign_out
  def destroy
    Rails.cache.clear
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
