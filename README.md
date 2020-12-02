# テーブル設計

## usersテーブル

| Column             | Type     | option       |
| ------------------ | -------- | ------------ |
| email              | string   | null: false  |
| encrypted_password | string   | null: false  |
| nickname           | string   | null: false  |
| last_name          | string   | null: false  |
| first_name         | string   | null: false  |
| last_name_kana     | string   | null: false  |
| last_name_kana     | string   | null: false  |
| birthday           | date     | null: false  |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column           | Type       | option                         |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| delivery_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :delivery_date

## ordersテーブル

| Column       | Type       | option                         |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## Addressesテーブル

| Column        | Type       | option                         |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Associationテーブル

- belongs_to :order
- belongs_to_active_hash :prefecture