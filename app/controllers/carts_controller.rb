class CartsController < ApplicationController


	def index
		@cart_item = CartItem.find(current_customer[:id])
		@cart_items = CartItem.all
		@current_customer = current_customer
	end

	def create
		# item = Item.find(params[:item_id])
		# cart_item = current_customer.cart_items.new(item_id: item.id)
		# cart_item.save
		# redirect_to carts_index_path
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
