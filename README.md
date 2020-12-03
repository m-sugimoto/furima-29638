
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
| birthday | date | null: false |
| nickname | string | null: false |
| firstname     | string | null: false |
| name     | string | null: false |
| firstname_reading     | string | null: false |
| name_readeing     | string | null: false |
| email    | string | null: false, unique: true|
| encrypted_password | string | null: false |

### Association

- has_many :records
- has_many :items

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| comodity | string | null: false |
| explan | text | null: false|
| category_id | integer | null: false |
| price | integer | null: false |
| user   | references | null: false, foreign_key: true |
| status_id | integer | null: false |
| prefecture_id | integer | null: false |
| postage_id | integer | null: false |
| sendingday_id | integer | nill: false |

### Association

- belongs_to :user
- has_one :record

## records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key :true |
| item   | references | null: false, foreign_key :true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column  | Type       | Options |
| ------- | ---------- | ---------------------------- |
| postal_code | string |null: false|
| prefecture_id | integer | null :false|
| city | string | null:false |
| house_number | string | null :false |
| bulding_name | string |  |
| telnumber | string | null:false |
｜record | references | null:false, foreign_key :true |

### Association


- belongs_to :record
