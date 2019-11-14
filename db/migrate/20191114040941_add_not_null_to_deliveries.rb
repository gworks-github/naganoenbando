class AddNotNullToDeliveries < ActiveRecord::Migration[5.2]
  def change
    change_column_null :deliveries, :last_name, false
  end
end
