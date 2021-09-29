class OrderShipping
  include ActiveModel::Model
  attr_accessor   :token, :postal_code, :prefecture_id, :unicipality, :address, :building, :tel_number, :item_id ,:price, :user_id
  
  with_options presence: true do
    validates :token     #クレジットカードのトークン
    validates :price     #商品の価格
    #配送先情報
    VALID_POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
    validates :postal_code, format: {with: VALID_POSTAL_CODE_REGEX ,allow_blank: true, message: "is invalid. Include hyphen(-)"} #郵便番号
    validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}  #都道府県の選択が「--」の時は保存できない
    validates :unicipality
    validates :address
    VALID_TEL_NUMBER_REGEX = /\A[0-9]{10,11}\z/
    validates :tel_number  , format: {with:VALID_TEL_NUMBER_REGEX , allow_blank: true,message: "is invalid"}    #電話番号は10桁または11桁の整数→修正が必要
    #配送先情報
    validates :item_id
    validates :user_id
  end

def save
  #購入記録を保存する
  order = Order.create(user_id: user_id, item_id: item_id)
  #発送先情報を保存する
  Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, unicipality: unicipality, address: address, building: building, tel_number: tel_number, order_id: order.id)
end

end