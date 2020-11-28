
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| firstname     | string | null: false |
| name     | string | null: false |
| firstname_reading     | string | null: false |
| name_readeing     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :item_users
- has_many :items, through: item_users
- has_one :records

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| comodity | string | null: false |
| kategory | string | null: false |
| price | string | null: false |
| seller | string | null: false |
| users_id | string | null: false |
| status | string | null: false |
| fromsend | string | null: false |
| postage | string | null: false |
| sendingday | string | nill: false |

### Association

- has_many :item_users
- has_many :users, through: item_users
- has_one :records

## item_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## records テーブル

| Column  | Type       | Options |
| ------- | ---------- | ---------------------------- |
| postal_code | string |null: false|
| pergecter | integer | null :false|
| city | string | null:false |
| house_number | string | null:false |
| bulding_name | string | null:true |
| telnumber | string | null:false |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address


