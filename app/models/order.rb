class Order < ApplicationRecord
	has_many :order_details,dependent: :destroy
	belongs_to :tax_in_postage
	belongs_to :customer
	enum payment_method: [:銀行振込, :クレジットカード, :代金引換]
	# cash_transfer　credit_card　Cash_on_delivery

	def self.get_payment(v)
		method =["銀行振込", "クレジットカード", "代金引換"]
		method[v]
	end 
end
