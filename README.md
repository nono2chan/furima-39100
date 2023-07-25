# README

# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false ,unique: true |
| password_confirmation | string | null: false               |
| family_name           | string | null: false               |
| first_name            | string | null: false               |
| family_name_kana      | string | null: false               |
| first_name_kana       | string | null: false               |  
| birth_day             | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type     |Options                          |
| -------------------| --------- | ------------------------------ |
| name               | string    | null: false                    |
| image              | string    | null: false                    |
| price              | integer   | null: false                    |
| tax                | boolean   | null: false                    |
| text               | text      | null: false                    |
| quality_id         | integer   | null: false                    |
| genre_id           | integer   | null: false                    |
| prefecture_id      | integer   | null: false                    |
| payment_id         | integer   | null: false                    |
| days_id            | integer   | null: false                    |
| user               | references| null: false ,foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase

## purchases テーブル
| Column             | Type      | Options                        |
| -------------------| --------- | ------------------------------ |
| user               | references| null: false ,foreign_key: true |
| item               | references| null: false                    |


### Association
- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column             | Type      |Options                        |
| -------------------| --------- | ----------------------------- |
| post_code          | string    | null:false                    |
| prefecture_id      | integer   | null:false                    |
| city               | string    | null:false                    |
| address            | string    | null:false                    |
| building_name      | string    |                               |
| phone_number       | string    | null:false                    |
| purchase           | references| null:false ,foreign_key: true |

### Association
- belongs_to :purchase