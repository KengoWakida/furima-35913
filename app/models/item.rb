class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :days

  #カテゴリーの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
  #商品の状態の選択が「--」の時は保存できないようにする
  validates :status_id, numericality: { other_than: 0 , message: "can't be blank"}
  #配達料の選択が「--」の時は保存できないようにする
  validates :delivery_fee_id, numericality: { other_than: 0 , message: "can't be blank"}
  #都道府県の選択が「--」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  #日数の選択が「--」の時は保存できないようにする
  validates :days_id, numericality: { other_than: 0 , message: "can't be blank"}
  #価格は¥300〜¥9,999,999まで半角数値のみ保存
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
end
