# == Schema Information
#
# Table name: insurances
#
#  id          :integer          not null, primary key
#  name        :string
#  issue_date  :date
#  expiry_date :date
#  vehicle_id  :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class InsuranceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
