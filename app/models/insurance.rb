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

class Insurance < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :user
  validates :vehicle, presence: true
  validates :user, presence: true
end
