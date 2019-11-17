class ItemsController < ApplicationController
  # def new
  # 	@item = Item.new
  # end

  # def create
  # 	item = Item.new(item_params)
  # 	item.save
  #   redirect_to items_path
  # end

  def index
  	@items = Item.all
    # @artists = Artist.all
    # @labels = Label.all
    # @genres = Genre.all
    # @q = Item.ransack(params[:q])
    # @items = @q.result(distinct: true)
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
  	params.require(:item).permit!
    params.require(:q).permit(:name,:artist_id,:label_id,:genre_id)
  end

end



