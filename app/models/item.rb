class Item < ApplicationRecord

	attachment :jacket_image
	has_many :cart_items, dependent: :destroy
	has_many :disks, dependent: :destroy
end
