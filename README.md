# テーブル設計

## Usersテーブル

| Column   | Type   | Options    |
|--------- | ------ | ---------- |
| nickname | string | null:false |
| email    | string | null:false |
| password | string | null:false |

### Association

- has_many :hearts
- has_many :comments
- has_many :hear_mores
- has_many :likes

## Heartsテーブル

| Column      | Type    | Options                       |
| ----------- | ------- | ----------------------------- |
| user_id     | integer | null:false, foreign_key: true |
| title       | string  | null:false                    |
| detail      | text    | null:false                    |
| category_id | integer | null:false                   |

### Association

- belongs_to :user
- has_many :comments
- has_many :hear_mores
- has_many :likes
- belongs_to :categories

## Commentsテーブル

| Column   | Type    | Options    |
| -------- | ------- | ---------- |
| user_id  | integer | null:false |
| heart_id | integer | null:false |
| text     | text    | null:false |

### Association

- belongs_to :user
- belongs_to :heart

## Hear_moresテーブル

| Column   | Type    | Options    |
| -------- | ------- | ---------- |
| user_id  | integer | null:false |
| heart_id | integer | null:false |

### Association

- belongs_to :user
- belongs_to :heart

## Likesテーブル

| Column   | Type    | Options    |
| -------- | ------- | ---------- |
| user_id  | integer | null:false |
| heart_id | integer | null:false |

### Association

- belongs_to :user
- belongs_to :heart

## Categoriesテーブル

| Column   | Type    | Options    |
| -------- | ------- | ---------- |
| heart_id | integer | null:false |
| name     | string  | null:false |
| ancestry | text    | null:false |


### Association

- has_many :hearts