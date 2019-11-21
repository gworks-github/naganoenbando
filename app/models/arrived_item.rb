class ArrivedItem < ApplicationRecord
	belongs_to :item
  #入荷検索
  scope :item_search, -> (search_params) do
    name_like(search_params[:name])
      .artist_like(search_params[:artist])
      #.format_like(search_params[:format])
      #.label_like(search_params[:label])
      #.genre_like(search_params[:genre])
      #.date_like(search_params[:date])
  end
  scope :name_like, -> (name)     {
    includes(:item).where(['items.name like ?', "%#{name}%"]).references(:items) if name.present?
  }

  scope :artist_like, -> (artist) {
    includes(item: [:artist]).where('artists.name like ?', "%#{artist}%").references(:artists) if artist.present?
  }

  scope :format_like, -> (format) {
    include(:item).where(['item.format like ?', "%#{format}%"]) if format.present?
  }

  #scope :label_like, -> (label)   {
  #  include(:item).where(['item.label_id like ?', "%#{lable}%"]) if label.present?
  #}

  #scope :genre_like, -> (genre)   {
  #  include(:item).where(['item.genre_id like ?', "%#{genre}%"]) if genre.present?
  #}

  #scope :date_like, -> (date)     {
  #  where(['date like ?', "%#{date}%"]) if date.present?
  #}

end
