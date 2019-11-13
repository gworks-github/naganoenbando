class AddTaxIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :tax_id, :integer
  end
end
