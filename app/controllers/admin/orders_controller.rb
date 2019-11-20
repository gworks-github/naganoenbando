class Admin::OrdersController < ApplicationController
	def update
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
