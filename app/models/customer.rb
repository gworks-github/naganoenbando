class Customer < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :deliveries, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #論理削除するため
  acts_as_paranoid

  # 1～20文字以上
  validates :first_name, length: {in: 1..20}, presence: true
  validates :last_name,  length: {in: 1..20}, presence: true

  # 全角カタカナ
  VALID_furigana_REGEX = /\A[ァ-ヶー－]+\z/
  validates :first_furigana, length: {in: 1..20}, presence: true,
    format: { with: VALID_furigana_REGEX }
  validates :last_furigana,  length: {in: 1..20}, presence: true,
    format: { with: VALID_furigana_REGEX }

  #固定電話と携帯番号(ハイフンなし10桁or11桁)
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone_number, presence: true,
    format: { with: VALID_PHONE_REGEX }

  #郵便番号（ハイフンあり・なし両方）
  VALID_POST_REGEX = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/
  validates :post_code, presence: true,
    format: { with: VALID_POST_REGEX }

  validates :address, presence: true

  #ログイン後,現在のパスワードなしで会員情報を更新する
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  #顧客検索
  scope :cust_search, -> (search_params) do
    last_name_like(search_params[:last_name])
      .first_name_like(search_params[:first_name])
      .address_like(search_params[:address])
      .phone_number_like(search_params[:phone_number])
      .email_like(search_params[:email])
  end
  scope :last_name_like, -> (last_name) {where(['Last_name like ?', "%#{last_name}%"]) if last_name.present? }
  scope :first_name_like, -> (first_name) {where(['first_name like ?', "%#{first_name}%"]) if first_name.present?}
  scope :address_like, -> (address) {where(['address like ?', "%#{address}%"]) if address.present?}
  scope :phone_number_like, -> (phone_number) {where(['phone_number like ?', "%#{phone_number}%"]) if phone_number.present?}
  scope :email_like, -> (email) {where(['email like ?', "%#{email}%"]) if email.present?}

end
