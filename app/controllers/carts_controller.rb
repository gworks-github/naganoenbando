class CartsController < ApplicationController
before_action :authenticate_customer!

	def index
		@cart_items = CartItem.where(customer: current_customer[:id])
		@current_customer = current_customer
	end

	def create
		# すでにカートに同じ商品がある場合は数量をプラス、ない場合は新規作成
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.customer_id = current_customer.id
		carted_item = CartItem.find_by(item_id: @cart_item.item_id, customer_id: current_customer.id)
		if carted_item == nil
			@cart_item.save
		elsif carted_item.item_id == @cart_item.item_id
			carted_item.quantity = carted_item.quantity + @cart_item.quantity
			carted_item.save
			else
			@cart_item.save
		end
			redirect_to carts_index_path
	end

	def destroy
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
		redirect_to carts_index_path
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
