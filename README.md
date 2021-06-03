# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false unique: true|
| encrypted_password  | string | null: false |
| last-name           | string | null: false |
| first-name          | string | null: false |
| last-name-kana      | string | null: false |
| first-name-kana     | string | null: false |
| user-birth-date     | date | null: false |



### Association
- has_many :items
- has_many :buys
  

## items テーブル

| Column                     | Type   | Options     |
| ------                     | ------ | ----------- |
| item-name                  | string | null: false |
| item-info                  | string | null: false |
| item-category_id           | integer  | null: false |
| item-sales-status          | string | null: false  |
| item-shipping-fee-status   | string | null: false |
| item-prefecture            | string | null: false |
| item-schedule-delivery     | string| null: false  |
| item-price                 | string| null: false　 |
| user_id                    | references | null: false foreign_key: true |

### Association
- belongs_to :buy
- has_many :buys
- belongs_to :user


## buys テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association
- has_one :item
- has_one :address


## addresses テーブル

| Column       | Type       | Options                        |
| ------       | ---------- | ------------------------------ |
| postal-code  | string | null: false|
| item-category_id    |  integer  | null: false |
| city         | string | null: false|
| addresses    | string | null: false|
| building     | string |
| phone-number | string | null: false|

### Association
- belongs_to :buy 
