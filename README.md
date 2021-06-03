# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| encrypted_password-confirmation  | string | null: false |
| last-name           | string | null: false |
| first-name          | string | null: false |
| last-name-kana      | string | null: false |
| first-name-kana     | string | null: false |
| user-birth-date     | string | null: false |



### Association
- has_many :items
- has_many :buys
  

## items テーブル

| Column                     | Type   | Options     |
| ------                     | ------ | ----------- |
| item-name                  | references | null: false foreign_key: true |
| item-info                  | references | null: false foreign_key: true |
| item-category              | references | null: false foreign_key: true |
| item-sales-status          | references | null: false foreign_key: true |
| item-shipping-fee-status   | references | null: false foreign_key: true |
| item-prefecture            | references | null: false foreign_key: true |
| item-schedule-delivery     | references | null: false foreign_key: true |
| item-price                 | references | null: false foreign_key: true |
| user_id                    | references | null: false foreign_key: true |

### Association
- belongs_to :buy
- has_many :buys
- belongs_to :user


## buy テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| buy_user  | references | null: false, foreign_key: true |
| buy_item  | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |

### Association
- has_one :item
- belongs_to :address


## address テーブル

| Column       | Type       | Options                        |
| ------       | ---------- | ------------------------------ |
| postal-code  | string | null: false|
| prefecture   | string | null: false|
| city         | string | null: false|
| addresses    | string | null: false|
| building     | string |
| phone-number | string | null: false|

### Association
- has_one :buy 
