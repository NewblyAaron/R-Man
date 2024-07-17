class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.decimal :capacity

      t.timestamps
    end
  end
end
