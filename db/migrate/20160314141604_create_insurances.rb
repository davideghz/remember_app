class CreateInsurances < ActiveRecord::Migration
  def change
    create_table :insurances do |t|
      t.string :name
      t.date :issue_date
      t.date :expiry_date

      t.belongs_to :vehicle, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
