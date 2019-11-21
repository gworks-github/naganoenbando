class Admin::DeliveriesController < ApplicationController
	    layout 'admin'
	    
  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy
    redirect_to admin_customer_path(id: delivery.customer_id)
  end
end
