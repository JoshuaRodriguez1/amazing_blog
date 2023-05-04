module Api
  module V1
    class SessionsController < Api::V1::BaseController
      before_action :skip_verify_authorized!

      def create
        if create_token.success?
          render json: { msg: "log in successful", token: create_token.authentication_token }
        else
          render json: { msg: "invalid" }
        end
      end

      private

      def credential_params
        params[:credentials].present? ? params[:credentials] : { email: "", password: "" }
      end
    
      def create_token
        @create_token ||= Users::CreateAuthenticationToken.call(credentials: credential_params)
      end
    end
  end
end
