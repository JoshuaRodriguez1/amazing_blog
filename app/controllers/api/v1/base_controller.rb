module Api
  module V1
    class BaseController < ActionController::API
      # TODO: maybe using the devise-jwt is a better way
      include ActionPolicy::Controller
      include ApiAuthorization
      include JwtAuthentication
    end
  end
end
