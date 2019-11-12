class CartsController < ApplicationController

	def index
		@cart_items = CartItem.all
	end

	def create
		@cart_item = CartItem.new
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
