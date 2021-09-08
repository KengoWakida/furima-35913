class Item < ApplicationRecord
  belongs_to :users

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
end
