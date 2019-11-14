class Delivery < ApplicationRecord
  belongs_to :customer

  # 1～20文字以上
  validates :first_name, length: {in: 1..20}
  validates :last_name,  length: {in: 1..20}, presence: true

  # 全角カタカナ 存在チェックしない
  VALID_furigana_REGEX = /\A[ァ-ヶー－]+\z/
  validates :first_furigana, length: {in: 1..20},
    format: { with: VALID_furigana_REGEX }
  validates :last_furigana,  length: {in: 1..20},
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

end
