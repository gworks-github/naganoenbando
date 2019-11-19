class OrdersController < ApplicationController
  def create
	@cart_items = CartItem.where(customer: current_customer[:id])
  	if params[:address] == "0"
  	order = Order.new(customer_id: current_customer.id,
				tax_in_postage_id: TaxInPostage.last.price,
				   payment_method: Order.get_payment(params[:pay].to_i),
						  address: current_customer.address,
					 phone_number: current_customer.phone_number,
					 	post_code: current_customer.post_code,
			   tax_in_total_price: 3000)
	else
	order = Order.new(customer_id: current_customer.id,
				tax_in_postage_id: TaxInPostage.last.price,
				   payment_method: Order.get_payment(params[:pay].to_i),
						   adress: Delivery.where(customer_id: current_customer[:id]).first(params[:address].to_i).pluck(:adress),
					 phone_number: Delivery.where(customer_id: current_customer[:id]).first(params[:address].to_i).pluck(:phone_number),
					 	post_code: Delivery.where(customer_id: current_customer[:id]).first(params[:address].to_i).pluck(:post_cade))
							end
  	order.save
  	@cart_items.each_with_index do |item, index|
  		index = OrderDetail.new(order_id: order.id,
								 item_id: item.item_id,
								   price: Item.find(item.item_id).price,
						  order_quantity: item.quantity)
  		index.save
  	end
  	redirect_to carts_thanks_path
  end
  def index
  	@orders = Order.all
  end

  def show
  	@order_details = OrderDetail.all
  end
end

