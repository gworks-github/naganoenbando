class CreateTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :taxes do |t|
      t.decimal :rate, null: false

      t.timestamps
    end
  end
end
