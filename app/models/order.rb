class Order < ApplicationRecord
	has_many :order_details,dependent: :destroy
	belongs_to :tax_in_postage
	belongs_to :customer
	enum payment_method: [['銀行振込', 0], ['クレジットカード', 1],['代金引換', 2]]
end
