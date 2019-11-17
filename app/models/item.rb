class Item < ApplicationRecord
	attachment :jacket_image
	has_many :cart_items, dependent: :destroy
	has_many :disks, dependent: :destroy
	has_many :arrived_items
	has_many :likes
	# belongs_to :genre
	# belongs_to :label
	# belongs_to :artist

end
