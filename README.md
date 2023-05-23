## users テーブル

| Column                  | Type       | Options      |
| ----------------------- | ---------- | ------------ |
| nickname                | string     | null: false  |
| email                   | string     | unique: true |
| encrypted_password      | string     | null: false  |
| first_name              | string     | null: false  |
| last_name               | string     | null: false  |
| last_name_kana          | string     | null: false  |
| first_name_kana         | string     | null: false  |
| birthday                | date       | null: false  |

### Association

has_many :items
has_many :buys





## items テーブル

| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| product_image            | binary     | null: false |
| product_name             | string     | null: false |
| product_description      | text       | null: false |
| product_detail_category  | integer_id | null: false |
| product_detail_condition | integer_id | null: false |
| delivery_charge          | integer_id | null: false |
| delivery_region          | integer_id | null: false |
| delivery_day             | integer_id | null: false |
| price                    | float      | null: false |

### Association

belongs_to :user
has_one    :order




## orders テーブル


### Association

belongs_to :items
has_one    :deliverys


## deliverys テーブル

| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| post_code                | string     | null: false |
| prefectures              | integer_id | null: false |
| municipalities           | string     | null: false |
| address                  | string     | null: false |
| Building                 | string     | null: false |
| tell                     | string     | null: false |

### Association

belongs_to :orders