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
#

class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_one :insurance, dependent: :destroy

  validates :user_id, presence: true
  validates :matriculation_date, presence: true

end
