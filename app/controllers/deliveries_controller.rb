class DeliveriesController < ApplicationController
  def create
    delivery = current_customer.deliveries.new(delivery_params)
  	delivery.save
    redirect_to show_customer_path(id: delivery.customer_id)
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
