module Users
  class CreateAuthenticationToken
    include Interactor

    delegate :credentials, to: :context

    def call
      context.fail!(error: "invalid credentials") unless user_authenticated?

      context.authentication_token = authentication_token
    end

    def authentication_token
      ::JWT.encode(payload, jwt_secret, "HS256")
    end

    def payload
      {
        "sub": user.id
      }
    end
    
    def jwt_secret
      "fhaohf(HGA*Fh0)"
    end

    def user
      @user ||= User.find_by(email: credentials[:email])
    end

    def user_authenticated?
      user&.valid_password?(credentials[:password])
    end
  end
end
