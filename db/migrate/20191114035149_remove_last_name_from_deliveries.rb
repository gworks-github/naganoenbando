class RemoveLastNameFromDeliveries < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliveries, :last_name, :string
    remove_column :deliveries, :first_name, :string
  end
end
