class OrderDetail < ApplicationRecord
	belongs_to :order

  #受注数
  scope :order_item_quantity, -> (id) {
    where(item_id:id).group(:item_id).sum(:order_quantity)
  }
end
