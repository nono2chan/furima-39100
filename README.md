# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false ,unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |  
| birth_day          | date   | null: false               |

### Association
- has_many :products
- has_many :purchaces

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

## products テーブル

| Column             | Type     |Options                          |
| -------------------| --------- | ------------------------------ |
| name               | string    | null: false                    |
| price              | integer   | null: false                    |
| description        | text      | null: false                    |
| status_id          | integer   | null: false                    |
| category_id        | integer   | null: false                    |
| prefecture_id      | integer   | null: false                    |
| shopping_cost_id   | integer   | null: false                    |
| shopping_day_id    | integer   | null: false                    |
| user               | references| null: false ,foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchace

## purchases テーブル
| Column             | Type      | Options                        |
| -------------------| --------- | ------------------------------ |
| user               | references| null: false ,foreign_key: true |
| product            | references| null: false                    |
| destination        | references| null: false ,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :destination