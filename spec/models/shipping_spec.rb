require 'rails_helper'

RSpec.describe Shipping, type: :model do
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
      end
      it 'すべての項目
        postal_code(郵便番号)、
        prefecture_id(都道府県)、
        unicipality(市区町村)、
        address(番地)、
        building(建物)、
        tel_number(電話番号)（11桁の入力）
        が正しく入力されている場合、保存できる' do
      end
      it 'building(建物名)が空欄の場合、保存できる' do
        
      end
    end
    context '配送先情報が保存されない場合' do
      it 'postal_code(郵便番号)が空欄の場合、保存できない' do
        
      end
      it 'postal_code(郵便番号)にハイフン（-）がない場合、保存できない' do
        
      end
      it 'postal_code(郵便番号)が英字の場合、保存できない' do
        
      end
      it 'postal_code(郵便番号)が全角の場合、保存できない' do
        
      end
      it 'prefecture_id(都道府県)が選択されていない場合、保存できない' do
        
      end
      it 'unicipality(市区町村)が選択されていない場合、保存できない' do
        
      end
      it 'address(番地)が選択されていない場合、保存できない' do
        
      end
      it 'tel_number(電話番号)が選択されていない場合、保存できない' do
        
      end
      it 'tel_number(電話番号)が9桁以下の場合、保存できない' do
        
      end
      it 'tel_number(電話番号)が12桁以上の場合、保存できない' do
        
      end
      it 'tel_number(電話番号)が全角の場合、保存できない' do
        
      end
      it 'tel_number(電話番号)が英字の場合、保存できない' do
        
      end
      it 'order(購入情報)が紐づいていない場合、保存できない' do
        
      end
    end
  end

end
