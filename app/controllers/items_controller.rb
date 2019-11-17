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
    @artists = Artist.all
    @labels = Label.all
    @genres = Genre.all
    # @q = Item.ransack(params[:q])
    # @items = @q.result(distinct: true)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @likes = Like.where(item_id: @item.id)
  end

  def edit
  end

  def update
  end

  def destroy

  end

  def search
    @artists = Artist.all
    @labels = Label.all
    @genres = Genre.all

    # if params,[:artist][:id] == nil
    @items = Item.where(artist_id: params[:artist][:id].to_i, label_id: params[:label][:id].to_i, genre_id: params[:genre][:id].to_i)
    # else
    @find_artist = Item.where(artist_id: params[:artist][:id].to_i)
    @find_label = Item.where(label_id: params[:label][:id].to_i)
    @find_genre = Item.where(genre_id: params[:genre][:id].to_i)
    # end

    # タイトル検索　# モデルクラス.where("列名 LIKE ?", "%値%")
    @items =  Item.where("name LIKE ?", "%#{params[:name]}%")

    render :index
  end

  private

  def item_params
  	params.require(:item).permit!
    params.require(:q).permit(:name,:artist_id,:label_id,:genre_id)
  end

end



