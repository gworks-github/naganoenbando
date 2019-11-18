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

  private

  def item_params
  	params.require(:item).permit(:name,:artist_id,:format,:jacket_image,:genre_id,:prices,:tax_id,:label_id,:quantity,:release_date,:is_selling)
  end

end
