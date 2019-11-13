class CreateDisks < ActiveRecord::Migration[5.2]
  def change
    create_table :disks do |t|
      t.integer :item_id, null: false
      t.integer :disk_number
      t.integer :quantity

      t.timestamps
    end
  end
end
