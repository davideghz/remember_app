# == Schema Information
#
# Table name: vehicles
#
#  id                 :integer          not null, primary key
#  name               :text
#  matriculation_date :date
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  vehicle_picture    :string
#

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
