# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |


### Association

- has_many :recipes
- has_many :comments

## recipes テーブル

| Column              | Type       | Options                          |
| ------------------- | ---------- | -------------------------------- |
| title               | string     | null: false                      |
| detail              | text       | null: false                      |
| item                | text       | null: false                      |
| recipe_info1        | text       | null: false                      |
| recipe_info2        | text       | null: false                      |
| recipe_info3        | text       | null: false                      |
| recipe_info4        | text       |                                  |
| recipe_info5        | text       |                                  |
| recipe_time_id      | integer    | null: false                      |
| category_id         | integer    | null: false                      |
| user                | references | null: false, , foreign_key: true |


### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column              | Type       | Options                          |
| ------------------- | ---------- | -------------------------------- |
| text                | text       |                                  |
| user_id             | integer    |                                  |
| recipe_id           | integer    |                                  |



### Association

- belongs_to :user
- belongs_to :recipes

