class CreateArrivedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :arrived_items do |t|
      t.integer :item_id, null: false
      t.integer :quantity, null: false
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
