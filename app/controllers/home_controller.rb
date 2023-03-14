class HomeController < ApplicationController

  before_action :authenticate_current_user!

  def index
  end
end
