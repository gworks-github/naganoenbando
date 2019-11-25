class UsersController < ApplicationController

  before_action :correct_customer, only: [:show, :destroy]
  def correct_customer
    @customer   = Customer.find(params[:id])
    @cust_check = current_customer
    unless @customer == @cust_check
      redirect_to root_path
    end
  end

  def show
    @deliveries = @customer.deliveries
    @delivery   = @customer.deliveries.new
    @deli       = @customer.deliveries.new #error_check用
  end

  def destroy
  end

end
