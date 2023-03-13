module Authentication
  extend ActiveSupport::Concern

  class UserUnAuthenticated < StandardError
  end

  included do
    rescue_from UserUnAuthenticated, with: :user_unauthenticated!

    helper_method :current_user
  end

  def authenticate_current_user!
    return if session[:current_user_id] && current_user.present?

    raise UserUnAuthenticated, "please log in"
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def user_unauthenticated!
    flash[:alert] = "please log in!"
    redirect_to login_path
  end
end
