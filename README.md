# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |


### Association

- has_many :recipes


## recipes テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| title               | string | null: false               |
| time                | integer| null: false               |
| how_to_cook         | text   | null: false               |


### Association

- belongs_to :user


