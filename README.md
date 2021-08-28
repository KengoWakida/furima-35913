# テーブル設計

## users テーブル （ユーザー）
| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| user_id        | integer | null: false |
| nickname       | string  | null: false |
| e-mail         | string  | null: false |
| password       | string  | null: false |
| lastname       | string  | null: false |
| firstname      | string  | null: false |
| lastname_kana  | string  | null: false |
| firstname_kana | string  | null: false |
| birth_year     | integer | null: false |
| birth_month    | integer | null: false |
| birth_day      | integer | null: false | 

### Association

- has_many :items
- has_many :orders
- has_many: comments


## items テーブル (商品情報)
| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| item_id         | integer | null: false |
| product_name    | string  | null: false |
| explanation     | text    | null: false |
| category_id     | integer | null: false |
| status_id       | integer | null: false |
| delivery_fee_id | integer | null: false |
| prefecture_id   | string  | null: false |
| days_id         | integer | null: false |
| price           | integer | null: false |
| user_id         | integer | null: false | 

### Association 

- has_one :orders
- has_many :comments
- has_one :category(Active Hash)
- has_one :status(Active Hash)
- has_one :delivery(Active Hash)
- has_one :days(Active Hash)

## orders テーブル (購入記録)
| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| order_id        | integer | null: false, foreign_key: true |
| items_id        | integer | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :shipping
- has_one :prefecture(Active Hash)

## shipping テーブル (発送先情報)
| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| shipping_id     | integer | null: false |
| postal_code     | string  | null: false |
| prefecture_id   | integer | null: false |
| unicipality     | string  | null: false |
| address         | string  | null: false |
| building        | string  |             |
| tel_number      | string  | null: false |

### Association

- belongs_to :orders

## comments テーブル (コメント)
| Column          | Type    | Options                         |
| --------------- | ------- | ------------------------------- |
| comment_id      | integer | null: false                     |
| comment         | text    | null: false                     |
| user_id         | integer | null: false,  foreign_key: true |
| items_id        | integer | null: false,  foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items