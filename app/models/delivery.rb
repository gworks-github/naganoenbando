class Delivery < ApplicationRecord
  belongs_to :customer

  # 1～20文字以上
  validates :first_name, length: {maximum: 20}, presence: false
  validates :last_name,  length: {in: 1..20}, presence: true

  # 全角カタカナ 存在チェックしない
  # 空白だと正規表現でエラーになるので空白でないときのみバリデーションチェックする
  VALID_furigana_REGEX = /\A[ァ-ヶー－]+\z/
  validates :first_furigana, length: {maximum: 20},
    format: { with: VALID_furigana_REGEX }, unless: :first_furigana_blank?
  validates :last_furigana,  length: {maximum: 20},
    format: { with: VALID_furigana_REGEX }, unless: :last_furigana_blank?

  def first_furigana_blank?
    first_furigana == ""
  end
  def last_furigana_blank?
    last_furigana == ""
  end

  #固定電話と携帯番号(ハイフンなし10桁or11桁)
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone_number, presence: true,
    format: { with: VALID_PHONE_REGEX }

  #郵便番号（ハイフンあり・なし両方）
  VALID_POST_REGEX = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/
  validates :post_code, presence: true,
    format: { with: VALID_POST_REGEX }

  validates :address, presence: true

end
