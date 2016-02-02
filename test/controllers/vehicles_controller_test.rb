require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase

  def setup
    @vehicle = vehicles(:v1)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Vehicle.count' do
      post :create, vehicle: { name: "Car", matriculation_date: "2015/01/01" }
    end
    assert_redirected_to new_user_session_path
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Vehicle.count' do
      delete :destroy, id: @vehicle
    end
    assert_redirected_to new_user_session_path
  end

end
