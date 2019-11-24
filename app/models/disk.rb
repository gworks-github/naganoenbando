class Disk < ApplicationRecord
		belongs_to :item
		has_many :tracks, dependent: :destroy, inverse_of: :disk
		accepts_nested_attributes_for :tracks, reject_if: :all_blank, allow_destroy: true
end
