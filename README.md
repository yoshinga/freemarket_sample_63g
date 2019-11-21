# freemarket_sample_63g DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_kana_name|string|null: false|
|first_kana_name|string|null: false|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|telephone_number|integer||
|birthday|integer|default: '登録されていません'|
|Exhibiting|integer||
|profile|text||
|evalution_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
|todo_id|references|foreign_key: true|
<!-- 住所 -->
|Postal_code|integer|null: false|
|Prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||

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
|sold_or_bought|boolean||
|image|string||
|item_name|string|null: false, add_index:true|
|discription|text||
|user_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
|brand|string||
|condition|string||
|price|integer|null: false|
|delivery_fee|integer|null: false|
|delivery_days|integer|null: false|
|item_trading|boolean||
|item_sold|boolean||
|item_sales_amount|boolean||
### Association
- belongs_to :category
- belongs_to :user
- has_many :comments
- has_many :users, through: :favorites



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|first_category|string|null: false|
|second_category|string|null: false|
|third_category|string|null: false|
### Association
- has_many :items



## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user



## evalutionsテーブル
|Column|Type|Options|
|------|----|-------|
|evalution|text||
|user_id|references|foreign_key: true|
### Association
- belongs_to :user



## todosテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|todo_content|text||
### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
### Association
- belongs_to :item



## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|total_point|integer||
|history|string||
|expiration_data|integer||
|user_id|references|foreign_key: true|
### Association
- has_one :user

<!-- ------運営側------- -->

## newsテーブル
|Column|Type|Options|
|------|----|-------|
|news_content|text|null: false|
### Association



## noticesテーブル
|Column|Type|Options|
|------|----|-------|
|notice|istring|null: false|
|user_id|references|foreign_key: true|
### Association
- has_many :user, through: :user_notices



## user_noticesテーブル
|Column|Type|Options|
|------|----|-------|
|notice_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
### Association
- belongs_to :notice
- belongs_to :user