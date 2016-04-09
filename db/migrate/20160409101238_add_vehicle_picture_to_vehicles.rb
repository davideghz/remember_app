class AddVehiclePictureToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :vehicle_picture, :string
  end
end
