class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Registered"
      redirect_to login_path
    else
      flash.now[:notice] = "Something went wrong"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :email, :password)
  end
end
