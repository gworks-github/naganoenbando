class ItemsController < ApplicationController

  def index
  	@items = Item.all

    #検索フォーム用
    @artists_search = Artist.all
    @labels_search = Label.all
    @genres_search = Genre.all

    #いいねランキング用
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

    #検索フォーム用
    @artists_search = Artist.all
    @labels_search = Label.all
    @genres_search = Genre.all

    #いいねランキング用
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
    #検索結果
    @items = Item.item_search(params)

    #検索フォーム用
    @artists_search = Artist.all
    @labels_search  = Label.all
    @genres_search  = Genre.all

    #いいねランキング用
    #本番
    #@likes_ranks = Item.find(Like.where(created_at:1.week.ago.beginning_of_day..1.day.ago.end_of_day).group(:item_id).order(Arel.sql('count(item_id) desc')).limit(5).pluck(:item_id))
    #test
    @likes_ranks = Item.find(Like.where(created_at:1.week.ago.beginning_of_day..Time.zone.now.end_of_day).group(:item_id).order(Arel.sql('count(item_id) desc')).limit(5).pluck(:item_id))
    @likes_ranks_count = @likes_ranks.map{|id| Like.where(item_id: id).count}
    @ranks_number = [*1..5]

    render :index
  end

  private

  def item_params
  	params.require(:item).permit(:name,:artist_id,:label_id,:genre_id,:format,:quantity,:release_date,:is_selling,:prices,:jacket_image_id,:tax_id)
    params.require(:q).permit(:name,:artist_id,:label_id,:genre_id)
  end

end
