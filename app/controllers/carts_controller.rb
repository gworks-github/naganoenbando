class CartsController < ApplicationController
before_action :authenticate_customer!

	def index
		@cart_item = CartItem.new
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
		@delivery = Delivery.new
		@customer = current_customer
		@deliveries = Delivery.where(customer: current_customer[:id])
		@cart_items = CartItem.where(customer: current_customer[:id])
		@order_detail = OrderDetail.new
	end

	def update
		@cart_items = CartItem.where(customer: current_customer[:id])
		n = 0
		@cart_items.each do |f|
			f.quantity = params["#{n}"]
			f.save
			n += 1
		end
		redirect_to carts_info_path
	end

	def confirm
		@cart_items = CartItem.where(customer: current_customer[:id])
		@tax = Tax.last.rate + 1
		@postage = TaxInPostage.last.price
		@total_price = 0
		@cart_items.each do |item|
			@total_price += Item.find(item.item_id).prices * item.quantity * @tax
		end
		@total_price += @postage
	end

	def thanks
	end

	def in_cart_create_address
		delivery = current_customer.deliveries.new(delivery_params)
	  	delivery.save
	    redirect_to carts_info_path
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:quantity, :item_id, :customer_id)
	end

	def delivery_params
		params.require(:delivery).permit(:customer_id,:post_code,:address,:phone_number,:last_name,:first_name,:first_furigana,:last_furigana)
	end
end
