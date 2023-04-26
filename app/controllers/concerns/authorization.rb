module Authorization
  extend ActiveSupport::Concern

  included do
    verify_authorized

    rescue_from ActionPolicy::Unauthorized, with: :deny_access!
  end

  def deny_access!
    flash[:alert] = "you are not authotized!"
    redirect_to root_path
  end
end