class CreatePuroks < ActiveRecord::Migration[7.0]
  def change
    create_table :barangay_puroks do |t|
      t.belongs_to :barangay
      t.string :name
      t.integer :population

      t.timestamps
    end
  end
end
