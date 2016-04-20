# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#

class UsersController < ApplicationController

  before_action :correct_user, only: [:show]
  before_action :admin_user,   only: :destroy

  def show
    add_breadcrumb "home", :root_path
    add_breadcrumb "my vehicles", :current_user

    @user = User.find(params[:id])
    @vehicles = @user.vehicles if user_signed_in?
    @vehicle = current_user.vehicles.build
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html {
        redirect_to users_url
        flash.now[:success] = "User deleted"
      }
      format.js { flash.now[:success] = "User deleted with Ajax" }
    end
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
      if (current_user != @user)
        flash[:danger] = "Wrong profile!"
        redirect_to(root_url)
      end
    end

    # Confirms an admin user.
    def admin_user
      redirect_to root_url, flash: "Can't delete!" unless current_user.admin?
    end

end
