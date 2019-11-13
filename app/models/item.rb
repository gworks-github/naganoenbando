class Item < ApplicationRecord

	attachment :jacket_image
  has_many :cart_items, dependent: :destroy

end
