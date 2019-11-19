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
    
    #本番
    #@likes_ranks = Item.find(Like.where(created_at:1.week.ago.beginning_of_day..1.day.ago.end_of_day).group(:item_id).order(Arel.sql('count(item_id) desc')).limit(5).pluck(:item_id))
    #test
    @likes_ranks = Item.find(Like.where(created_at:1.week.ago.beginning_of_day..Time.zone.now.end_of_day).group(:item_id).order(Arel.sql('count(item_id) desc')).limit(5).pluck(:item_id))
    @likes_ranks_count = @likes_ranks.map{|id| Like.where(item_id: id).count}
    @ranks_number = [*1..5]
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @likes = Like.where(item_id: @item.id)
    #本番
    #@likes_ranks = Item.find(Like.where(created_at:1.week.ago.beginning_of_day..1.day.ago.end_of_day).group(:item_id).order(Arel.sql('count(item_id) desc')).limit(5).pluck(:item_id))
    #test
    @likes_ranks = Item.find(Like.where(created_at:1.week.ago.beginning_of_day..Time.zone.now.end_of_day).group(:item_id).order(Arel.sql('count(item_id) desc')).limit(5).pluck(:item_id))
    @likes_ranks_count = @likes_ranks.map{|id| Like.where(item_id: id).count}
    @ranks_number = [*1..5]
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
  	params.require(:item).permit(:name,:artist_id,:label_id,:genre_id,:format,:quantity,:release_date,:is_selling,:prices,:jacket_image_id,:tax_id)
    params.require(:q).permit(:name,:artist_id,:label_id,:genre_id)
  end

end
