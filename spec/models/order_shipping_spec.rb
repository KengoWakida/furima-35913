require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    describe '配送先情報の保存' do
      context '配送先情報が保存できる場合' do
        it 'すべての項目
          postal_code(郵便番号)、
          prefecture_id(都道府県)、
          unicipality(市区町村)、
          address(番地)、
          building(建物)、
          tel_number(電話番号)（10桁の入力）
          が正しく入力されている場合、保存できる' do
          expect(@order_shipping).to be_valid
        end
        it 'すべての項目
          postal_code(郵便番号)、
          prefecture_id(都道府県)、
          unicipality(市区町村)、
          address(番地)、
          building(建物)、
          tel_number(電話番号)（11桁の入力）
          が正しく入力されている場合、保存できる' do
          @order_shipping.tel_number = '09039307121'
          expect(@order_shipping).to be_valid
        end
        it 'building(建物名)が空欄の場合、保存できる' do
          @order_shipping.building = ''
          expect(@order_shipping).to be_valid
        end
      end
      context '配送先情報が保存されない場合' do
        it 'postal_code(郵便番号)が空欄の場合、保存できない' do
          @order_shipping.postal_code = ''
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_code(郵便番号)にハイフン（-）がない場合、保存できない' do
          @order_shipping.postal_code = '9390362'
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        it 'postal_code(郵便番号)が英字の場合、保存できない' do
          @order_shipping.postal_code = 'qeq-oegz'
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        it 'postal_code(郵便番号)が全角の場合、保存できない' do
          @order_shipping.postal_code = '６３２ー２９１７'
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        it 'prefecture_id(都道府県)が選択されていない場合、保存できない' do
          @order_shipping.prefecture_id = 0
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'unicipality(市区町村)が入力されていない場合、保存できない' do
          @order_shipping.unicipality = ''
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Unicipality can't be blank")
        end
        it 'address(番地)が入力されていない場合、保存できない' do
          @order_shipping.address = ''
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
        end
        it 'tel_number(電話番号)が入力されていない場合、保存できない' do
          @order_shipping.tel_number = ''
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Tel number can't be blank")
        end
        it 'tel_number(電話番号)が9桁以下の場合、保存できない' do
          @order_shipping.tel_number = '090393071'
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Tel number is invalid")
        end
        it 'tel_number(電話番号)が12桁以上の場合、保存できない' do
          @order_shipping.tel_number = '090393071210'
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Tel number is invalid")
        end
        it 'tel_number(電話番号)が全角の場合、保存できない' do
          @order_shipping.tel_number = '０９０３９３０７１２１'
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Tel number is invalid")
        end
        it 'tel_number(電話番号)が英字の場合、保存できない' do
          @order_shipping.tel_number = 'oqoeqeojizi'
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Tel number is invalid")
        end
        it 'user(ユーザー情報)が紐づいていない場合、保存できない' do
          @order_shipping.user_id = nil
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("User can't be blank")
        end
        it 'item(商品情報)が紐づいていない場合、保存できない' do
          @order_shipping.item_id = nil
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
end
