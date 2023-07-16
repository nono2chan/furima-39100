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

## destination テーブル

| Column             | Type   | Options                        |
| -------------------| ------ | ------------------------------ |
| post_code          | string | null: false                    |
| prefecture         | string | null: false                    |
| city               | string | null: false                    |
| address            | string | null: false                    |
| building_name      | string |                                |
| phone_number       | string | null: false                    |


## product テーブル

| Column             | Type     | Options                        |
| -------------------| -------- | ------------------------------ |
| name               | string   | null: false                    |
| price              | integer  | null: false                    |
| description        | text     | null: false                    |
| status             | integer  | null: false                    |
| size               | string   | null: false                    |
| shopping_cost      | integer  | null: false                    |
| shopping_days      | integer  | null: false                    |
| prefecture_id      | integer  | null: false                    |
| category_id        | integer  | null: false ,foreign_key: true |
| brand_id           | integer  | null: false ,foreign_key: true |
| shopping_id        | integer  | null: false ,foreign_key: true | 
| user_id            | reference| null: false ,foreign_key: true |
