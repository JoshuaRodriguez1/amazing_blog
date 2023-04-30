module JwtAuthentication
  extend ActiveSupport::Concern

  class UnAuthenticated < StandardError
  end

  included do
    rescue_from UnAuthenticated, with: :deny_access!
  end

  def authenticate_user!
    return if current_user.present?

    raise UnAuthenticated
  end

  def current_user
    return if access_token.blank?

    User.find_by(id: payload['sub'])
  end

  def access_token
    @access_token ||= request.headers["Authorization"]&.split&.last  
  end

  def payload
    JWT.decode(access_token, jwt_secret, true, { algorithm: "HS256"}).first
  end

  def jwt_secret
    "fhaohf(HGA*Fh0)"
  end

  def deny_access!
    render json: { error: "unauthenticated user"}
  end 
end
