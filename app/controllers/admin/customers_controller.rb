class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @deliveries = @customer.deliveries
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @customers = Customer.all.cust_search(params)
    render :index
  end

end
