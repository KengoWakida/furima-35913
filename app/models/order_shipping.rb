class OrderShipping
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :unicipality, :address, :building, :tel_number, :order_id
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is _invalid. Include hyphen(-)"}
    #都道府県の選択が「--」の時は保存できないようにする
    validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :unicipality
    validates :address
    validates :tel_number {with: /\A[0-9]{10..11}\z/, message: 'is invalid'}
    validates :order_id
  end

def save
  #購入記録を保存する
  @order = Order.create(user_id: user_id, item_id: item_id)
  #発送先情報を保存する
  Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, unicipality: unicipality, address: address, building: building, tel_number: tel_number, order_id: order.id)
end

end