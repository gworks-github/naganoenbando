class OrdersController < ApplicationController
  def create
	@cart_items = CartItem.where(customer: current_customer[:id])
	# 合計金額の計算
	@total_price = 0
		@cart_items.each do |item|
			@total_price += (Item.find(item.item_id).prices * item.quantity * (Tax.last.rate + 1)).floor
		end
		@total_price += TaxInPostage.last.price
  	if params[:address] == "0"
	  	order = Order.new(customer_id: current_customer.id,
					tax_in_postage_id: TaxInPostage.last.id,
					   payment_method: params[:pay].to_i,
							  address: current_customer.address,
						 phone_number: current_customer.phone_number,
						 	post_code: current_customer.post_code,
						 		 name: current_customer.last_name + current_customer.first_name,
						 	 furigana: current_customer.last_furigana + current_customer.first_furigana,
				   tax_in_total_price: @total_price)
	else
		order = Order.new(customer_id: current_customer.id,
					tax_in_postage_id: TaxInPostage.last.id,
					   payment_method: params[:pay].to_i,
							  address: Delivery.where(customer_id: current_customer[:id]).first(params[:address].to_i).pluck(:address).last,
						 phone_number: Delivery.where(customer_id: current_customer[:id]).first(params[:address].to_i).pluck(:phone_number).last,
						 	post_code: Delivery.where(customer_id: current_customer[:id]).first(params[:address].to_i).pluck(:post_code).last,
						 		 name: Delivery.where(customer_id: current_customer[:id]).first(params[:address].to_i).pluck(:last_name).last + Delivery.where(customer_id: current_customer[:id]).first(params[:address].to_i).pluck(:first_name).last,
						 	 furigana: Delivery.where(customer_id: current_customer[:id]).first(params[:address].to_i).pluck(:last_furigana).last + Delivery.where(customer_id: current_customer[:id]).first(params[:address].to_i).pluck(:first_furigana).last,
				   tax_in_total_price: @total_price)
	end
  	if order.save
	  	@cart_items.each_with_index do |item, index|
	  		index = OrderDetail.new(order_id: order.id,
									 item_id: item.item_id,
									   price: (Item.find(item.item_id).prices * (Tax.last.rate + 1)).floor,
							  order_quantity: item.quantity)
		index.save
  		end
	  	@cart_items.destroy_all
	  	redirect_to carts_thanks_path
  	else
  		lender carts_confirm_path
  	end
  end

  def index
  	@orders = Order.where(customer_id: current_customer.id).order(id: "DESC")
  	@order_details = OrderDetail.where()
  end

  def show
  	@order = Order.find(params[:id])
  	@order_details = OrderDetail.where(order_id: params[:id])
  end
end

