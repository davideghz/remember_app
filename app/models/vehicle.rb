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

class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_one :insurance, dependent: :destroy

  mount_uploader :vehicle_picture, VehiclePictureUploader
  validates :user_id, presence: true
  validates :matriculation_date, presence: true
  validate  :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if vehicle_picture.size > 2.megabytes
        errors.add(:vehicle_picture, "should be less than 3MB")
      end
    end

end
