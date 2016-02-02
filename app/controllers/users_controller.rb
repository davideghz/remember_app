class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @vehicles = @user.vehicles
  end

  def index
    @users = User.all
  end
end
