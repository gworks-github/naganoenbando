class ArrivedItem < ApplicationRecord
	belongs_to :item
  #入荷検索
  scope :item_search, -> (search_params) do
    name_like(search_params[:name])
      .artist_select(search_params[:artist][:id])
      .format_check((search_params[:single]),(search_params[:album]))
      .label_select(search_params[:label][:id])
      .genre_select(search_params[:genre][:id])
      .date_search((search_params[:date_from]),(search_params[:date_to]))
  end

  scope :name_like, -> (name)     {
    includes(:item).where(['items.name like ?', "%#{name}%"]).references(:items) if name.present?
  }

  scope :artist_select, -> (artist)   {
    includes(:item).where(['items.id = ?', "#{artist}"]).references(:items) if artist.present?
  }

  scope :format_check, -> (single,album) {
    includes(:item).where(['items.format = ? or items.format = ?', "#{single}", "#{album}"]).references(:items) if single.present? or album.present?
  }

  scope :label_select, -> (label)   {
    includes(:item).where(['items.label_id = ?', "#{label}"]).references(:items) if label.present?
  }

  scope :genre_select, -> (genre)   {
    includes(:item).where(['items.genre_id = ?', "#{genre}"]).references(:items) if genre.present?
  }

  scope :date_search, -> (date_from,date_to)     {
    where(['date >= ? and date <= ?', "#{date_from} 00:00:00", "#{date_to} 23:59:59"]) if date_from.present? and date_to.present?
  }

end
