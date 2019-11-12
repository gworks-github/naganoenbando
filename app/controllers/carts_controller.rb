class CartsController < ApplicationController

	def index
		@cart_items = CartItem.all
	end

	def create
		@cart_item = Cart_item(params[:id])
		@cart_item.save
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
