module Authentication
  extend ActiveSupport::Concern

  class UnAuthenticatedUser < StandardError
  end

  included do
    rescue_from UnAuthenticatedUser, with: :need_authentication!
  end

  def authenticate_current_user!
    return if current_user.present?
    raise UnAuthenticatedUser, "log in!"
  end

  def need_authentication!
    flash[:notice] = "You must log in!"
    redirect_to new_user_session_path
  end

end