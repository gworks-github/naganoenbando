class CartsController < ApplicationController


	def index
		@cart_item = Cart_item.find(current_user[:id])
		@cart_items = CartItem.all
		@current_customer = current_customer
		@cart_items = CartItem.all
	end

	def create
		item = Item.find(params[:item_id])
		cart_item = current_customer.cart_items.new(item_id: item.id)
		cart_item.save
		redirect_to carts_index_path
	end

	def destroy
	end

	def info
	end

	def confirm
	end

	def new
	end
end
