# freemarket_sample_63g DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index:true|
|kana_name|string|null: false|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|telephone_number|integer|unique: true|
|birthday|integer||
|Exhibiting|integer|null: false|
|profile|text|null: false|
<!-- 住所 -->
|Postal code|integer|null: false|
|Prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|evalution_id|refernces||
|item_id|refernces||
|todo_id|refernces||


<!-- |payment|string|null: false| -->

### Association
- has_many :todos
- has_many :evalutions
- has_many :items, through: :favorites
- has_many :items
- has_one :point
- has_many :notice, through: :user_notices

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|sold_or_bought|boolean|null: false|
|image|string|null: false|
|item_name|string|null: false|
|discription|text|null: false|
|user_id|refernces|null: false|
|category_id|refernces|null: false|
|brand|string|null: false|
|condition|string|null: false|
|price|integer|null: false|
|delivery_fee|integer|null: false|
|delivery_days|integer|null: false|
|item_trading|boolean|null: false|
|item_sold|boolean|null: false|
|item_sales_amount|boolean|null: false|
### Association
- belongs_to :category
- belongs_to :user
- has_many :comments
- has_many :users, through: :favorites


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|item_id|refernces|null: false, foreign_key: true|
|first_category|string|null: false, foreign_key: true|
|second_category|string|null: false, foreign_key: true|
|third_category|string|null: false, foreign_key: true|
### Association
- has_many :items

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|refernces|null: false, foreign_key: true|
|item_id|refernces|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## evalutionsテーブル
|Column|Type|Options|
|------|----|-------|
|evalution|text|null: false|
|user_id|refernces|null: false, foreign_key: true|
### Association
- belongs_to :user

## todosテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|refernces|null: false|
|user_id|refernces|null: false|
|todo_content|text|null: false, foreign_key: true|
### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|refernces|null: false, foreign_key: true|
|item_id|refernces|null: false, foreign_key: true|
### Association
- belongs_to :item

## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|total_point|integer|null: false|
|history|string|null: false, foreign_key: true|
|expiration_data|integer|null: false, foreign_key: true|
|user_id|refernces|null: false, foreign_key: true|
### Association
- has_one :user

<!-- ------運営側------- -->

## newsテーブル
|Column|Type|Options|
|------|----|-------|
|news_content|text|null: false, foreign_key: true|
### Association

## noticesテーブル
|Column|Type|Options|
|------|----|-------|
|notice|istring|null: false, foreign_key: true|
|user_id|refernces|null: false, foreign_key: true|
### Association
- has_many :user, through: :user_notices

## user_noticesテーブル
|Column|Type|Options|
|------|----|-------|
|notice_id|refernces|null: false, foreign_key: true|
|user_id|refernces|null: false, foreign_key: true|
### Association
- belongs_to :notice
- belongs_to :user