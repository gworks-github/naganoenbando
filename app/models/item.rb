class Item < ApplicationRecord
	attachment :jacket_image
	has_many :cart_items, dependent: :destroy
	has_many :disks, dependent: :destroy , inverse_of: :item
	accepts_nested_attributes_for :disks, reject_if: :all_blank, allow_destroy: true
	has_many :arrived_items
	has_many :ready_items
	has_many :likes
	belongs_to :genre
	belongs_to :label
	belongs_to :artist


	def self.add_tax
		method = (self.prices * (Tax.last.rate + 1)).floor
		return method
	end

  #商品検索
  scope :item_search, -> (search_params) do
    artist_select(search_params[:artist][:id])
      .label_select(search_params[:label][:id])
      .genre_select(search_params[:genre][:id])
      .name_like(search_params[:name])
  end

  scope :artist_select, -> (artist)   {
    where(['id = ?', "#{artist}"]) if artist.present?
  }

  scope :label_select, -> (label)   {
    where(['label_id = ?', "#{label}"]) if label.present?
  }

  scope :genre_select, -> (genre)   {
    where(['genre_id = ?', "#{genre}"]) if genre.present?
  }

  scope :name_like, -> (name)     {
    where(['name like ?', "%#{name}%"]).references(:items) if name.present?
  }

end
