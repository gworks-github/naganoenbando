class CreateTaxInPostages < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_in_postages do |t|
      t.integer :price, null: false

      t.timestamps
    end
  end
end
