class InfoController < ApplicationController
  def index
  	@item = Item.new
  	item = Item.new(item_params)
  	item.save
  	redirect_to info_index_path
  	@items = Item.all
  end

  def item_params
  	params.require(:item).permit(:name,:artist_id,:label_id,:genre_id)
  end
end
