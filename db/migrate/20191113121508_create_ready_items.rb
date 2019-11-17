class CreateReadyItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ready_items do |t|
      t.integer :item_id, null: false

      t.timestamps
    end
  end
end
