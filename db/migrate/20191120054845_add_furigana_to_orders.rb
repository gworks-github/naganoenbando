class AddFuriganaToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :furigana, :string
  end
end
