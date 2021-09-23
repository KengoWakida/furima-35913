class OrderShipping
  include ActiveModel::Model
  attr_accessor   :postal_code, :prefecture_id, :unicipality, :address, :building, :tel_number, :item_id ,:user_id
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is _invalid. Include hyphen(-)"}
    #都道府県の選択が「--」の時は保存できないようにする
    validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :unicipality
    validates :address
    #電話番号は10桁または11桁の整数
    validates :tel_number ,numericality: {only_integer: true , greater_than_or_equal_to: 0000000000, less_than_or_equal_to: 99999999999, message: 'is invalid'}
  end

def save
  #購入記録を保存する
  order = Order.create(user_id: user_id, item_id: item_id)
  #発送先情報を保存する
  Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, unicipality: unicipality, address: address, building: building, tel_number: tel_number, order_id: order.id)
end

end