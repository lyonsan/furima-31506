# テーブル設計

## usersテーブル

| Column    | Type     | option       |
| --------- | -------- | ------------ |
| email     | string   | null: false  |
| password  | string   | null: false  |
| nickname  | string   | null: false  |
| name      | string   | null: false  |
| birthday  | date     | null: false  |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column        | Type       | option                         |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| explanation   | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| delivery_fee  | string     | null: false                    |
| delivery_from | string     | null: false                    |
| delivery_date | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column       | Type       | option                         |
| ------------ | ---------- | ------------------------------ |
| card_number  | integer    | null: false                    |
| exp_date     | date       | null: false                    |
| seq_code     | integer    | null: false                    |
| postal_code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :item