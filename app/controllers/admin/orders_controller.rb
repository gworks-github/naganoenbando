class Admin::OrdersController < ApplicationController
	def update
		order = Order.find(params[:id])
		order.order_status = params[:order_status].to_i
		order.save
		redirect_to admin_order_path(params[:id])
	end

	def index
		@orders = Order.all
	  	@order_details = OrderDetail.where()
	end

	def show
	  	@order = Order.find(params[:id])
	  	@order_details = OrderDetail.where(order_id: params[:id])
	end

	def search
	    @orders = Order.all.order_search(params)
	    render :index
  	end

end
