class Order < ApplicationRecord
	has_many :order_details,dependent: :destroy
	belongs_to :tax_in_postage
	belongs_to :customer
	enum payment_method: [:銀行振込, :クレジットカード, :代金引換]
	enum order_status: [:注文受付, :商品準備中, :出荷済]
	# cash_transfer　credit_card　Cash_on_delivery

	def self.get_payment(v)
		method =["銀行振込", "クレジットカード", "代金引換"]
		method[v]
	end

	def self.get_status(v)
		method =["注文受付", "商品準備中", "出荷済"]
		method[v]
	end


	#注文検索※顧客検索より流用
  scope :order_search, -> (search_params) do
    	name_like(search_params[:name])
      .created_at_like(search_params[:created_at])
      .id_like(search_params[:id])
      .order_status_like(search_params[:order_status])
  end
  scope :name_like, -> (name) {where(['name like ?', "%#{name}%"]) if name.present? }
  scope :created_at_like, -> (created_at) {where(['created_at like ?', "%#{created_at}%"]) if created_at.present?}
  scope :id_like, -> (id) {where(['id like ?', "%#{id}%"]) if id.present?}
  scope :order_status_like, -> (order_status) {where(['order_status like ?', "%#{order_status}%"]) if order_status.present?}

end
