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


## category テーブル

| Column  | Type       | Options        |
| ------- | ---------- | ---------------|
| name    | string     | null: false    |
| ancestry| string     |                |

## product テーブル

| Column             | Type   | Options                        |
| -------------------| ------ | ------------------------------ |
| name               | string | null: false                    |
| price              | string | null: false                    |
| description        | string | null: false                    |
| status             | string | null: false                    |
| size               | string | null: false                    |
| shopping_cost      | string | null: false                    |
| shopping_days      | string | null: false                    |
| prefecture         | string | null: false                    |
| judgement          | string |                                |
| category_id        | integer| null: false ,foreign_key: true |
| brand_id           | integer| null: false ,foreign_key: true |
| shopping_id        | integer| null: false ,foreign_key: true |                  
| user_id            | integer| null: false ,foreign_key: true |

## image テーブル

| Column             | Type   | Options                        |
| -------------------| ------ | ------------------------------ |
| image              | string | null: false                    |
| product_id         | string | null: false,foreign_key: true  |

## brand テーブル

| Column             | Type   | Options                        |
| -------------------| ------ | ------------------------------ |
| name               | string | index: true                    |