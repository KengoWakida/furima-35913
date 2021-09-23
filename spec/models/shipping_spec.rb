require 'rails_helper'

RSpec.describe Shipping, type: :model do
  before do
    @shipping = FactoryBot.build(:shipping)
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
        expect(@shipping).to be_valid
      end
      it 'すべての項目
        postal_code(郵便番号)、
        prefecture_id(都道府県)、
        unicipality(市区町村)、
        address(番地)、
        building(建物)、
        tel_number(電話番号)（11桁の入力）
        が正しく入力されている場合、保存できる' do
        @shipping.tel_number = '09039307121'
        expect(@shipping).to be_valid
      end
      it 'building(建物名)が空欄の場合、保存できる' do
        @shipping.building = ''
        expect(@shipping).to be_valid
      end
    end
    context '配送先情報が保存されない場合' do
      it 'postal_code(郵便番号)が空欄の場合、保存できない' do
        @shipping.postal_code = ''
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_code(郵便番号)にハイフン（-）がない場合、保存できない' do
        @shipping.postal_code = '9390362'
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_code(郵便番号)が英字の場合、保存できない' do
        @shipping.postal_code = 'qeq-oegz'
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_code(郵便番号)が全角の場合、保存できない' do
        @shipping.postal_code = '９３９−０３６２'
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_id(都道府県)が選択されていない場合、保存できない' do
        @shipping.prefecture_id = 0
        expect(@shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'unicipality(市区町村)が入力されていない場合、保存できない' do
        @shipping.unicipality = ''
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Unicipality can't be blank")
      end
      it 'address(番地)が入力されていない場合、保存できない' do
        @shipping.address = ''
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'tel_number(電話番号)が入力されていない場合、保存できない' do
        @shipping.tel_number = ''
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_number(電話番号)が9桁以下の場合、保存できない' do
        @shipping.tel_number = '090393071'
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Tel number is invalid")
      end
      it 'tel_number(電話番号)が12桁以上の場合、保存できない' do
        @shipping.tel_number = '090393071210'
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Tel number is invalid")
      end
      it 'tel_number(電話番号)が全角の場合、保存できない' do
        @shipping.tel_number = '０９０３９３０７１２１'
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Tel number is invalid")
      end
      it 'tel_number(電話番号)が英字の場合、保存できない' do
        @shipping.tel_number = 'oqoeqeojizi'
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Tel number is invalid")
      end
      it 'order(購入情報)が紐づいていない場合、保存できない' do
        @shipping.order = nil
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Order must exist")
      end
    end
  end

end
