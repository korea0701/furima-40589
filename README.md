# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name               | string | null: false |
| name_kana          | string | null: false |
| birth_date         | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| product_image       | string     | null: false                    |
| product_name        | string     | null: false                    |
| product_description | text       | null: false                    |
| category            | string     | null: false                    |
| product_condition   | string     | null: false                    |
| shipping_fee        | string     | null: false                    |
| shipping_origin     | string     | null: false                    |
| shipping_days       | string     | null: false                    |
| price               | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| street             | string | null: false |
| building           | string |             |
| phone_number       | string | null: false |
| order              | references | null: false, foreign_key: true |

### Association

-belongs_to :order