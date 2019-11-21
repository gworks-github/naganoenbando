class Admin::ArrivedItemsController < ApplicationController
    layout 'admin'

	def index
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
    redirect_to admin_arrived_items_path
  end

  private
  def items_params
    params.permit(:date, item: [:item_id, :quantity])
  end

end
