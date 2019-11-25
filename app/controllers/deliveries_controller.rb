class DeliveriesController < ApplicationController
  def create
    @deli = current_customer.deliveries.new(delivery_params)

    if @deli.save
      redirect_to show_customer_path(id: @deli.customer_id)
    else
      # users/showでerrors.full_messagesをつかるようにするためrenderで引数を渡す
      @customer   = Customer.find(current_customer.id)
      @deliveries = @customer.deliveries
      @delivery   = @customer.deliveries.new
      render("users/show")
    end
  end

  def destroy
    delivery = current_customer.deliveries.find(params[:id])
    delivery.destroy
    redirect_to show_customer_path(id: delivery.customer_id)
  end

  private
  def delivery_params
  	params.require(:delivery).permit(:customer_id,:post_code,:address,:phone_number,:last_name,:first_name,:first_furigana,:last_furigana)
  end
end
