# テーブル設計

## users テーブル （ユーザー）
| Column             | Type    | Options             |
| ------------------ | ------- | ------------------- |
| nickname           | string  | null: false         |
| email              | string  | null: false, unique |
| encrypted_password | string  | null: false         |
| lastname           | string  | null: false         |
| firstname          | string  | null: false         |
| lastname_kana      | string  | null: false         |
| firstname_kana     | string  | null: false         |
| birthday           | date    | null: false         | 

### Association

- has_many :items
- has_many :orders
- has_many: comments


## items テーブル (商品情報)
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| product_name    | string     | null: false                    |
| explanation     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| days_id         | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true | 

### Association 

- has_one :order
- belongs_to :users
- has_many :comments


## orders テーブル (購入記録)
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| users           | references | null: false, foreign_key: true |
| items           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping


## shipping テーブル (発送先情報)
| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| postal_code     | string     | null: false                   |
| prefecture_id   | integer    | null: false                   |
| unicipality     | string     | null: false                   |
| address         | string     | null: false                   |
| building        | string     |                               |
| tel_number      | string     | null: false                   |
| order           | references | null: false,foreign_key: true |


### Association

- belongs_to :order

## comments テーブル (コメント)
| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| comment         | text       | null: false                     |
| user            | references | null: false,  foreign_key: true |
| item            | references | null: false,  foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item