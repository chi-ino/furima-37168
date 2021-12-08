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
| image           | string     | null: false                     |
| name            | string     | null: false                     |
| explanation     | text       | null: false                     |
| category_id     | integre    | null: false                     |
| status_id       | integre    | null: false                     |
| postage_id      | integre    | null: false                     |
| prefecture_id   | integre    | null: false                     |
| shipping_day_id | integre    | null: false                     |
| price           | integre    | null: false                     |
| user_id         | references | null: false,  foreign_key: true |

belongs_to :user
has_many :card

## cards テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :items
has_one :buyer

## buyers テーブル

| Column         | Type       | Options                         |
| -------------  | ---------- | ------------------------------- |
| cards_id       | references | null: false,  foreign_key: true |
| postal code    | string     | null: false                     |
| prefectures_id | integer	  | null: false                     |
| city           | string     | null: false                     |
| address        | string     | null: false                     |
| builiding      | string     | null: false                     |
| phone_number   | string     | null: false                     |

belongs_to : card