class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_one :insurance, dependent: :destroy

  validates :user_id, presence: true
  validates :matriculation_date, presence: true

end
