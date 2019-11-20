class OrdersController < ApplicationController
  def create
	@cart_items = CartItem.where(customer: current_customer[:id])
  	if params[:address] == "0"
	  	order = Order.new(customer_id: current_customer.id,
					tax_in_postage_id: TaxInPostage.last.id,
					   payment_method: params[:pay].to_i,
							   adress: current_customer.address,
						 phone_number: current_customer.phone_number,
						 	post_code: current_customer.post_code,
				   tax_in_total_price: 3000)
	else
		order = Order.new(customer_id: current_customer.id,
					tax_in_postage_id: TaxInPostage.last.id,
					   payment_method: params[:pay].to_i,
							   adress: Delivery.where(customer_id: current_customer[:id]).first(params[:address].to_i).pluck(:address).last,
						 phone_number: Delivery.where(customer_id: current_customer[:id]).first(params[:address].to_i).pluck(:phone_number).last,
						 	post_code: Delivery.where(customer_id: current_customer[:id]).first(params[:address].to_i).pluck(:post_code).last,
				   tax_in_total_price: 3000)
	end
		puts order.inspect
		puts current_customer.id
		puts TaxInPostage.last.price
		puts Order.get_payment(params[:pay].to_i)
		puts Delivery.where(customer_id: current_customer[:id]).first(params[:address].to_i).pluck(:address).last
		puts Delivery.where(customer_id: current_customer[:id]).first(params[:address].to_i).pluck(:phone_number).last
		puts Delivery.where(customer_id: current_customer[:id]).first(params[:address].to_i).pluck(:post_code).last

  	if order.save
	  	@cart_items.each_with_index do |item, index|
	  		index = OrderDetail.new(order_id: order.id,
									 item_id: item.item_id,
									   price: Item.find(item.item_id).prices,
							  order_quantity: item.quantity)
		index.save
		puts index.errors.full_messages
  		end
	  	@cart_items.destroy_all
	  	redirect_to carts_thanks_path
  	else
  		lender carts_confirm_path
  	end
  end

  def index
  	@orders = Order.where(customer_id: current_customer.id)
  	@order_details = OrderDetail.where()
  end

  def show
  	@order = Order.find(params[:id])
  	@order_details = OrderDetail.where(order_id: params[:id])
  end
end

