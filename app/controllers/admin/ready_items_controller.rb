class Admin::ReadyItemsController < ApplicationController

	def index
		@ready_items_id = ReadyItem.pluck(:item_id)
		@ready_items = Item.find(@ready_items_id)
		@arrived_items = ArrivedItem.new
	end

	def create
		ready_item = ReadyItem.new(item_id: params[:id])
		puts params[:id]
		ready_item.save
		redirect_to admin_items_path
	end

	def destroy
		item = ReadyItem.find(params[:id])
		puts item
		puts params[:id]
		item.destroy
		redirect_to admin_ready_items_path
	end
end
