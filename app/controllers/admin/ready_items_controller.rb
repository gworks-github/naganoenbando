class Admin::ReadyItemsController < ApplicationController

	def index
		@ready_items = Item.find(ReadyItem.pluck(:item_id))
	end

	def create
		ready_item = ReadyItem.new(item_id: params[:item_id])
		ready_item.save
		redirect_to admin_items_path
	end

	def destroy
	end
end
