class OrdersController < ApplicationController
  def create
  end
  def index
  	@orders = Order.all
  end

  def show
  	@order_details = OrderDetail.all
  end
end
