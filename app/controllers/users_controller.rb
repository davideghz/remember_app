class UsersController < ApplicationController

  before_action :correct_user, only: [:show]

  def show
    add_breadcrumb "home", :root_path
    add_breadcrumb "user profile", :current_user
    @user = User.find(params[:id])
    @vehicles = @user.vehicles if user_signed_in?
    @vehicle = current_user.vehicles.build if user_signed_in?
    @insurance = current_user.insurances.build if user_signed_in?
  end

  def index
    @users = User.all
  end

  def send_email
    RandomEmail.send_random_email(current_user).deliver_now
    redirect_to root_url
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
