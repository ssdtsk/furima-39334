## users テーブル

| Column                  | Type       | Options      |
| ----------------------- | ---------- | ------------ |
| nickname                | string     | null: false  |
| email                   | string     | null: false  |
| encrypted_password      | string     | null: false  |
| first_name              | string     | null: false  |
| last_name               | string     | null: false  |
| last_name_kana          | string     | null: false  |
| first_name_kana         | string     | null: false  |
| birthday                | date       | null: false  |

### Association

has_many :items
has_many :orders





## items テーブル

| Column                      | Type       | Options     |
| --------------------------- | ---------- | ----------- |
| product_name                | string     | null: false |
| product_description         | text       | null: false |
| product_detail_category_id  | integer    | null: false |
| product_detail_condition_id | integer    | null: false |
| delivery_charge_id          | integer    | null: false |
| delivery_region_id          | integer    | null: false |
| delivery_day_id             | integer    | null: false |
| price                       | float      | null: false |
| user                        | references | null: false, foreign_key: true |
### Association

belongs_to :user
has_one    :order




## orders テーブル

| Column                      | Type       | Options     |
| --------------------------- | ---------- | ----------- |
| item                        | references | null: false, foreign_key: true |

### Association

belongs_to :item
has_one    :deliverys


## deliverys テーブル

| Column                      | Type       | Options     |
| --------------------------- | ---------- | ----------- |
| post_code                   | string     | null: false |
| prefectures_id              | integer    | null: false |
| municipalities              | string     | null: false |
| address                     | string     | null: false |
| building                    | string     |             |
| tell                        | string     | null: false |
| order                       | references | null: false, foreign_key: true |
### Association

belongs_to :order