require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品情報が正しく入力されている時' do 
      it 'image(商品画像),
          product_name（商品名）,
          explanation（商品の説明）,
          category_id（カテゴリー）,
          status_id（商品の状態）,
          delivery_fee_id（配送料の負担）,
          prefecture_id（発送元の地域）,
          days_id（日数）,
          price（価格）が全て正しく入力されている時は保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品情報が正しく入力されていない時' do
      it 'image（商品画像）が空の時は保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'pruduct_name（商品名）が空の時は保存できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'explanation(商品の説明)が空の時は保存できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_id（カテゴリー）が選択されていない時は保存できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_id(商品の状態）が選択されていない時は保存できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'delivery_fee_id(配送料の負担)が選択されていない時は保存できない' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'prefecture_id(発送元の地域)が選択されていない時は保存できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'days_id(発送までの日数)が選択されていない時は保存できない' do
        @item.days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it 'price(販売価格)からの時は保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'price(販売価格)が¥300〜¥9,999,999の範囲外の数値の時は保存できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'price(販売価格)半角数値ではない時は保存できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end
