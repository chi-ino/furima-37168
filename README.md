# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |      

 has_many :items
 has_many :cards



##  items テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| name            | string     | null: false                     |
| explanation     | text       | null: false                     |
| category_id     | integer    | null: false                     |
| status_id       | integer    | null: false                     |
| postage_id      | integer    | null: false                     |
| prefecture_id   | integer    | null: false                     |
| shipping_day_id | integer    | null: false                     |
| price           | integer    | null: false                     |
| user            | references | null: false,  foreign_key: true |

belongs_to :user
has_one :card

## cards テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :buyer

## buyers テーブル

| Column         | Type       | Options                         |
| -------------  | ---------- | ------------------------------- |
| card           | references | null: false,  foreign_key: true |
| postal_code    | string     | null: false                     |
| prefecture_id  | integer    | null: false                     |
| city           | string     | null: false                     |
| address        | string     | null: false                     |
| building       | string     |                                 |
| phone_number   | string     | null: false                     |

belongs_to : card