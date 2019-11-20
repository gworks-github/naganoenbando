class ChangeColumnToOrders < ActiveRecord::Migration[5.2]
  	def self.up
		change_column :orders, :order_status, :integer, :null => true,:default => 0
	end

	def self.down
		change_column :orders, :order_status, :integer
	end
end
