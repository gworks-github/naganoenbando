class Admin::ItemsController < ApplicationController
  def new
  	@item = Item.new
  end

  def create
  	item = Item.new(item_params)
  	item.save
    redirect_to admin_items_path
  end

  def index
  	@items = Item.all
  end

  def show
	@item = Item.find(params[:id])
  end

  def edit
  	
  end

  def update
  	
  end

  def destroy
  	
  end

  def item_params
  	params.require(:item).permit(:name,:artist_id,:format,:jacket_image,:prices,:release_date,:label_id,:genre_id,:is_selling,:quantity)
  end

end
