class CartsController < ApplicationController

	before_action :authenticate_customer!

	def index
		@cart_item = Cart_item.find(current_user[:id])
		@cart_items = CartItem.all
		@current_customer = current_customer
		@cart_items = CartItem.all
	end

	def create
		@cart_item = CartItem.new
		@cart_item.customer_id = current_customer.id
		@cart_item.save
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
