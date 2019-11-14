class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :customer_id, null: false
      t.string  :first_name, null: false
      t.string  :last_name
      t.string  :first_furigana
      t.string  :last_furigana
      t.string  :post_code, null: false
      t.text    :address, null: false
      t.string  :phone_number, null: false

      t.timestamps
    end
  end
end
