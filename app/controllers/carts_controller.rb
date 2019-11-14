class CartsController < ApplicationController


	def index
		@cart_item = CartItem.find(current_customer[:id])
		@cart_items = CartItem.where(customer: current_customer[:id])
		@current_customer = current_customer
	end

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.save
		puts @cart_item.errors.full_messages
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

	private
		def cart_item_params
			params.require(:cart_item).permit(:quantity, :item_id, :customer_id)
		end

end
