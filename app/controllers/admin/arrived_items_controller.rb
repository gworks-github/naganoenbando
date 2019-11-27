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
    msg = []
    item_ids = []

    #商品や日付が空なら処理を止める
    if items.nil? or dates.blank?
      return redirect_to admin_ready_items_path, flash: { error: "入力項目が空です。" }
    end

    items.map! do |item|
      item_vals = item.values
      item_vals.push(dates)
    end

    items.each do |item|
      item_id  = item[0]
      quantity = item[1]
      date     = item[2]
      arrived_item = ArrivedItem.new(item_id:item_id,quantity:quantity,date:date)

      if arrived_item.save
        item_ids << item_id
      else
        err_item = Item.find(arrived_item.item_id)
        msg << "#{err_item.name} は登録できませんでした。#{arrived_item.errors.full_messages}"
      end

    end

    #登録できた商品を登録画面から消す
    if item_ids.present?
      item_ids.each do |id|
        ReadyItem.find_by(item_id:id).destroy
      end
    end

    #登録できなかった商品があれば登録画面に戻す
    if msg.present?
      return redirect_to admin_ready_items_path, flash: { error: msg }
    else
      redirect_to admin_arrived_items_path
    end
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
