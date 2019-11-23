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
|birthday|integer||
|exhibiting|integer||
|profile|text||
|evalution_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
|todo_id|references|foreign_key: true|
|address_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|

### Association
- has_many :todos, dependent: :destroy
- has_many :evalutions, dependent: :destroy
- has_many :items, dependent: :destroy
- has_one :point, dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :notices
- has_many :favorites

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|Postal_code|integer|null: false|
|Prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|user_id|references|foreign_key: true|

### Association
- has_one :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|sold_or_bought|boolean||
|image|string||
|item_name|string|null: false, add_index:true|
|discription|text||
|user_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
|evalution_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
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
- belongs_to :todo
- has_many :comments, dependent: :destroy
- has_many :favorite, dependent: :destroy
- has_many :evalution, dependent: :destroy

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|first_category_id|references|foreign_key: true|
|second_category_id|references|foreign_key: true|
|third_category_id|references|foreign_key: true|
### Association
- has_many :items
- has_one : first_category
- has_one : second_category
- has_one : third_category


## first_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|first_category|integer||
### Association
- has_one :category

## second_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|second_category|integer||

### Association
- has_one :category

## third_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|third_category|integer||
### Association
- has_one :category

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|user_id|string|null: false|
|brand_name|string|null: true|

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
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|total_point|integer||
|expiration_data|integer||
|user_id|references|foreign_key: true|
### Association
- has_one :user
- has_many :hestory, dependent: :destroy

## hestoriesテーブル
|Column|Type|Options|
|------|----|-------|
|point_id|integer||
|point_plus_or_minus|string||
|title|integer||
|date|references|foreign_key: true|
### Association
- belongs_to :point

<!-- ------運営側------- -->

## newsテーブル
|Column|Type|Options|
|------|----|-------|
|news_content|text|null: false|
|title|string|null: false|
### Association



## noticesテーブル
|Column|Type|Options|
|------|----|-------|
|notice|istring|null: false|
|user_id|references|foreign_key: true|
|title|string|null: false|
### Association
- belongs_to :user

