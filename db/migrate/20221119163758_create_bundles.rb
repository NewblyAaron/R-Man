class CreateBundles < ActiveRecord::Migration[7.0]
  def change
    create_table :bundles do |t|
      t.string :name

      t.timestamps
    end

    create_table :bundle_items do |t|
      t.belongs_to :bundle
      t.belongs_to :item
      t.integer :quantity

      t.timestamps
    end
  end
end
