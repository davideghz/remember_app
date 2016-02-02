class Vehicle < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :matriculation_date, presence: true

end
