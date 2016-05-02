require 'test_helper'

class API::V1::UsersControllerTest < ActionController::TestCase

  user = User.create(:email => 'test@example.com', :password => 'password', :password_confirmation => 'password')
  user.save

  p User.all

  p user.email
  p user.authentication_token

  test "index with token authentication via query params" do
    get :index, { user_email: user.email, user_token: user.authentication_token }
    assert_response :success
    # p response.body
  end

  test "index with token authentication via request headers" do
    @request.headers['X-User-Email'] = user.email
    @request.headers['X-User-Token'] = user.authentication_token
    get :index
    assert_response :success
  end

end