class Insurance < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :user
end