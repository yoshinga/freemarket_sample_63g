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
|item_name|string|null: false, add_index: true|
|discription|text||
|image_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
|evalution_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|condition|string||
|price|integer|null: false|
|delivery_fee|integer|null: false|
|delivery_days|integer|null: false|
|item_condition|integer||
### Association
- belongs_to :category
- belongs_to :user
- belongs_to :todo
- has_many :comments, dependent: :destroy
- has_many :favorite, dependent: :destroy
- has_many :evalution, dependent: :destroy

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|string||
|url|string||
### Association
- has_many :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|ancestry|integer|add_index:true|
### Association
- has_many :items
- has_ancestry

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
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
- has_many :hestories, dependent: :destroy

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

