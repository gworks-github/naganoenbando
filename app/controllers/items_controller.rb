class ItemsController < ApplicationController
  def new
  	@item = Item.new
  end

  def create
  	item = Item.new(item_params)
  	item.save
    redirect_to items_path
  	# else
  		# render :newnd
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

  private

  def item_params
  	params.require(:item).permit(:name,:artist_id,:format,:jacket_image,:genre_id,:prices,:tax_id,:label_id,:quantity,:release_date,:is_selling)
  end

end



