# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false unique: true|
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_kana      | string | null: false |
| first_name_kana     | string | null: false |
| user_birth_date     | date | null: false |



### Association
- has_many :items
- has_many :buys
  

## items テーブル

| Column                        | Type   | Options     |
| ------                        | ------ | ----------- |
| item_name                     | string | null: false |
| item_info                     | text | null: false |
| item_category_id              | integer  | null: false |
| item_sales-status_id          | integer | null: false  |
| item_shipping-fee-status_id   | integer | null: false |
| item_prefecture_id            | integer| null: false |
| item_schedule-delivery_id     | integer| null: false  |
| item_price                    | string| null: false　 |
| user                       | references | null: false foreign_key: true |

### Association
- has_one :buy
- belongs_to :user


## buys テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to:item
- belongs_to:user
- has_one :address


## addresses テーブル

| Column       | Type       | Options                        |
| ------       | ---------- | ------------------------------ |
| postal_code  | string | null: false|
| item_category_id    |  integer  | null: false |
| city         | string | null: false|
| address    | string | null: false|
| building     | string |
| phone_number | string | null: false|
| buy          | references | null: false, foreign_key: true |


### Association
- belongs_to :buy 
