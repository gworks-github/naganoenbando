class Order < ApplicationRecord
	has_many :order_details,dependent: :destroy
	belongs_to :tax_in_postage, :customer
end
