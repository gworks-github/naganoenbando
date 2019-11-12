class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :tax_in_postage_id
      t.integer :payment_method
      t.string :post_code
      t.text :adress
      t.string :phone_number
      t.integer :tax_in_total_price
      t.integer :order_status

      t.timestamps
    end
  end
end
