class OrdersController < ApplicationController
  def create
  	redirect_to carts_thanks_path
  end
  def index
  	@orders = Order.all
  end

  def show
  	@order_details = OrderDetail.all
  end
end
