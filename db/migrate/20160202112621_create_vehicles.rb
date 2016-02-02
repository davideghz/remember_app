class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.text :name
      t.date :matriculation_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
