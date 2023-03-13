class SessionsController < ApplicationController
  before_action :authenticate_current_user!, only: %i[show]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: user_params[:username])

    if @user&.authenticate(user_params[:password])
      session[:current_user_id] = @user.id
      flash[:notice] = "You have logged in succsesfully"
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
