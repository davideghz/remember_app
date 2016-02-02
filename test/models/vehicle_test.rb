require 'test_helper'

class VehicleTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @vehicle = Vehicle.new(name: "Macchina 1", matriculation_date: "2015/01/01", user_id: @user.id)
  end

  test "should be valid" do
    assert @vehicle.valid?
  end

end
