class CreateVehicleBundles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_bundles do |t|
      t.belongs_to :vehicle
      t.belongs_to :bundle
      t.integer :quantity

      t.timestamps
    end
  end
end
