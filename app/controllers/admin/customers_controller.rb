class Admin::CustomersController < ApplicationController
      layout 'admin'

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
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      redirect_to edit_admin_customer_path(@customer)
    end
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    redirect_to admin_customers_path
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
