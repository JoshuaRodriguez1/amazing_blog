module ApiAuthorization
  extend ActiveSupport::Concern

  included do
    verify_authorized

    rescue_from ActionPolicy::Unauthorized, with: :user_unauthorized!
  end

  def user_unauthorized!
    render json: { msg: "User unauthorized" }
  end
end
