class ItemsController < ApplicationController
  def new
  	@item = Item.new
  end

  def create
  	item = Item.new(item_params)
  	item.save
  	redirect_to '/items'
  end

  def index
  	@items = Item.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy

  end

  private

  def item_params
  	params.require(:item).permit(:name,:artist_id,:format,:jacket_image,:genre_id,:prices,:label_id,:quantity,:release_date,:is_selling)
  end
end


