class UsersController < ApplicationController

  before_action :correct_user, only: [:show]

  def show
    @user = User.find(params[:id])
    @vehicles = @user.vehicles
    @vehicle = current_user.vehicles.build if user_signed_in?
  end

  def index
    @users = User.all
  end

  private

    # before filters

    # Each user can access only his own profile
    def correct_user
      @user = User.find(params[:id])
      if current_user != @user
        flash[:danger] = "Wrong profile!"
        redirect_to(root_url)
      end
    end

end