class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @deliveries = @customer.deliveries
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer)
  end

  def destroy
  end

  def search
    @customers = Customer.all.cust_search(params)
    render :index
  end

  private
  def customer_params
  	params.require(:customer).permit(:first_name, :last_name, :first_furigana, :last_furigana, :post_code, :address, :phone_number, :email)
  end

end
