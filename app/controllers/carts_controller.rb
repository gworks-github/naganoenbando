class CartsController < ApplicationController
before_action :authenticate_customer!

	def index
		@cart_item = CartItem.new
		@cart_items = CartItem.where(customer: current_customer[:id])
		@current_customer = current_customer
	end

	def create
		# すでにカートに同じ商品がある場合は数量をプラス、ない場合は新規作成
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.customer_id = current_customer.id
		carted_item = CartItem.find_by(item_id: @cart_item.item_id, customer_id: current_customer.id)
		if carted_item == nil
			@cart_item.save
		elsif carted_item.item_id == @cart_item.item_id
			carted_item.quantity = carted_item.quantity + @cart_item.quantity
			carted_item.save
		else
			@cart_item.save
		end
		redirect_to carts_path
	end

	def destroy
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
		redirect_to carts_path
	end

	def info
		@delivery = Delivery.new
		@customer = current_customer
		@deliveries = Delivery.where(customer: current_customer[:id])
		@cart_items = CartItem.where(customer: current_customer[:id])
		@tax = Tax.last.rate + 1
		@postage = TaxInPostage.last.price
		# 税込総額の計算
		@total_price = 0
		@cart_items.each do |item|
			@total_price += (Item.find(item.item_id).prices * item.quantity * @tax).floor
		end
		@total_price += @postage
	end

	def update
		@cart_items = CartItem.where(customer: current_customer[:id])
		n = 0

    #エラーメッセージ格納用
    msg = []

		@cart_items.each do |f|
			f.quantity = params["#{n}"]
			n += 1

      #販売確認
      item_chk = Item.find(f.item_id)
      if item_chk.is_selling == false
        msg << "#{item_chk.name}は販売停止中です。"
        next
      end

      #在庫数
      arrived_item_quantity = ArrivedItem.arrived_item_quantity(f.item_id)
      order_item_quantity = OrderDetail.order_item_quantity(f.item_id)
      stock = arrived_item_quantity.merge(order_item_quantity) {
        |key,arrived,order| arrived - order }.values[0].to_i

      #在庫数と注文数の比較
      if stock >= f.quantity
        f.save
      else
        item_name = Item.find(f.item_id).name
        msg << "#{item_name}の注文数が在庫数(#{stock})を上回っています。"
      end
		end

    #在庫数を上回る商品がひとつでもあればレジに進ませない
    if msg.present?
      redirect_to carts_path, flash: { error: msg}
    else
      redirect_to carts_info_path
    end

	end

	def confirm
		@customer = current_customer
		deliveries = Delivery.where(customer_id: current_customer[:id])
		if params[:address] != "0"
			puts deliveries[0].address
			@delivery = deliveries[params[:address].to_i - 1]
		end
		@cart_items = CartItem.where(customer: current_customer[:id])
		@tax = Tax.last.rate + 1
		@postage = TaxInPostage.last.price
		# 税込総額の計算
		@total_price = 0
		@cart_items.each do |item|
			@total_price += (Item.find(item.item_id).prices * item.quantity * @tax).floor
		end
		@total_price += @postage
	end

	def thanks
	end

  def in_cart_create_address
    delivery = current_customer.deliveries.new(delivery_params)
    if delivery.save
      redirect_to carts_info_path
    else
      redirect_to carts_info_path, flash: { error: delivery.errors.full_messages }
    end
  end

	private
	def cart_item_params
		params.require(:cart_item).permit(:quantity, :item_id, :customer_id)
	end

	def delivery_params
		params.require(:delivery).permit(:customer_id,:post_code,:address,:phone_number,:last_name,:first_name,:first_furigana,:last_furigana)
	end
end
