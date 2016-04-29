require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "index with token authentication via query params" do
    get :index, { user_email: "davideghz@gmail.com", user_token: "oFFuam5QiaiqS7R_zYoZ" }
    assert_response :success
    # assert_response :redirect
  end

  test "index with token authentication via request headers" do
    @request.headers['X-User-Email'] = "davideghz@gmail.com"
    @request.headers['X-User-Token'] = "oFFuam5QiaiqS7R_zYoZ"

    get :index
    assert_response :success
    # assert_response :redirect
  end

end