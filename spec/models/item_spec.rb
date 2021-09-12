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
        
      end
    end
    context '商品出品情報が正しく入力されていない時' do
      it 'image（商品画像）が空の時は保存できない' do
        
      end
      it 'pruduct_name（商品名）が空の時は保存できない' do
        
      end
      it 'explanation(商品の説明)が空の時は保存できない' do
        
      end
      it 'category_id（カテゴリー）が選択されていない時は保存できない' do
        
      end
      it 'status_id(商品の状態）が選択されていない時は保存できない' do
        
      end
      it 'delivery_fee_id(配送料の負担)が選択されていない時は保存できない' do
        
      end
      it 'prefecture_id(発送元の地域)が選択されていない時は保存できない' do
        
      end
      it 'days_id(発送までの日数)が選択されていない時は保存できない' do
        
      end
      it 'price(販売価格)からの時は保存できない' do
        
      end
      it 'price(販売価格)が¥300〜¥9,999,999の範囲外の数値の時は保存できない' do
        
      end
      it 'price(販売価格)半角数値ではない時は保存できない' do
        
      end
    end
  end
end
