class API::V1::UsersController < ApplicationController

  acts_as_token_authentication_handler_for User

  respond_to :json

  def index
    users = User.all
    render json: {
        status: 200,
        message: "Successfully get users index",
        users: users
    }
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      render :json=> user.as_json(:auth_token=>user.authentication_token, :email=>user.email), :status=>201
      return
    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end