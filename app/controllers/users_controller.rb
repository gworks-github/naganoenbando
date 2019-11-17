class UsersController < ApplicationController
  def show
    @customer   = Customer.find(params[:id])
    @deliveries = @customer.deliveries
    @delivery   = @customer.deliveries.new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
