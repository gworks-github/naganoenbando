class Admin::ArrivedItemsController < ApplicationController
    layout 'admin'

  def index
    @items = ArrivedItem.all.order("date asc")

    #検索フォーム用
    @artists = Artist.all
    @labels  = Label.all
    @genres  = Genre.all
	end

  def create
    items = items_params[:item]
    dates = items_params[:date]

    items.map! do |item|
      item_vals = item.values
      item_vals.push(dates)
    end

    items.each do |item|
      item_id  = item[0]
      quantity = item[1]
      date     = item[2]
      arrived_item = ArrivedItem.new(item_id:item_id,quantity:quantity,date:date)
      arrived_item.save
    end

    ReadyItem.all.delete_all

    redirect_to admin_arrived_items_path
  end

  def search
    #検索結果
    @items = ArrivedItem.item_search(params).order("date asc")

    #検索フォーム用
    @artists = Artist.all
    @labels  = Label.all
    @genres  = Genre.all

    render :index
  end

  private
  def items_params
    params.permit(:date, item: [:item_id, :quantity])
  end

end
