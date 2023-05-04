 module Api
  module V1
    class RegistrationsController < Api::V1::BaseController

      def create
        @user = User.new(sign_up_params)

        if @user.save
          render json: { msg: "User created!" }
        else
          render json: { errors: @user.errors.full_messages }
        end
      end

      private

      def sign_up_params
        params.require(:user).permit(:username, :email, :email, :password, :password_confirmation)
      end
    end
  end
end
