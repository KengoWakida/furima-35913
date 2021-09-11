class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text            :image,           null: false  #画像
      t.string          :product_name,    null: false  #商品名
      t.text            :explanation,     null: false  #説明
      t.integer         :category_id,     null: false  #カテゴリー
      t.integer         :status_id,       null: false  #状態
      t.integer         :delivery_fee_id, null: false  #配送料
      t.integer         :prefecture_id,   null: false  #都道府県
      t.integer         :days_id,         null: false  #日数
      t.integer         :price,           null: false  #価格
      #t.references      :user,            null: false, foreign_key: true #ユーザーテーブル
      t.timestamps
    end
  end
end
