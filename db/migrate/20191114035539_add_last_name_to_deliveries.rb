class AddLastNameToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :last_name, :string
    add_column :deliveries, :first_name, :string
  end
end
