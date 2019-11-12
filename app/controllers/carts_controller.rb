class CartsController < ApplicationController

	def index
<<<<<<< HEAD
		@cart_item = Cart_item.find(current_user[:id])
=======
		@cart_items = CartItem.all
>>>>>>> kottu
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
