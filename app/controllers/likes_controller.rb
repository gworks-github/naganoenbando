class LikesController < ApplicationController
  before_action :correct_customer, only: [:index]
  def correct_customer
    @customer   = Customer.find(params[:id])
    @cust_check = current_customer
    unless @customer == @cust_check
      redirect_to root_path
    end
  end

  def index
    item_id = Like.where(customer_id: params[:id]).order(created_at: "DESC").pluck(:item_id)
    @items = Item.find(item_id)
  end

  def create
    item = Item.find(params[:item_id])
    like = current_customer.likes.new(item_id: item.id)
    like.save
    redirect_to item_path(item)
  end

  def destroy
    item = Item.find(params[:item_id])
    like = current_customer.likes.find_by(item_id: item.id)
    like.destroy
    redirect_to item_path(item)
  end

end
