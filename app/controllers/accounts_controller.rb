class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action ->{ authorize! with: AccountPolicy }

  def dashboard
  end
  
  def show
    @user = User.find_by(username: params[:username])
    
    if !@user
      flash[:alert] = "this user does not exists"
      redirect_to root_path
    end
  end

  def index
    @users = User.all
  end
end
