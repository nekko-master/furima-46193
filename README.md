## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| last_name          | text   | null: false               |
| first_name         | text   | null: false               |
| last_name_kana     | text   | null: false               |
| first_name_kana    | text   | null: false               |
| birthday           | text   | null: false               |

### Association
- has_many :exhibited_items
- has_many :purchased_items
- has_many :comments


## exhibited_itemsテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| image              | string | null: false               |
| item_name          | string | null: false               |
| explanation        | string | null: false               |
| detail             | string | null: false               |
| shipping_fee       | string | null: false               |
| shipping_origin    | string | null: false               |
| shipping_day       | string | null: false               |
| price              | string | null: false               |
| user               | string | null: false               |

### Association
- belongs_to :user
- has_one    :purchased_item
- has_many   :comments


## purchased_itemsテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| credit_card        | string | null: false               |
| expiration_date    | string | null: false               |
| security_code      | string | null: false               |
| postal_code        | string | null: false               |
| municipalities     | string | null: false               |
| street_address     | string | null: false               |
| building_name      | string | null: false               |
| phone_number       | string | null: false               |
| exhibited_item     | string | null: false               |
| user               | string | null: false               |

### Association
- belongs_to :user
- belongs_to :exhibited_item


## commentsテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| text               | string | null: false               |
| exhibited_item     | string | null: false               |
| user               | string | null: false               |

### Association
- belongs_to :user
- belongs_to :exhibited_item
