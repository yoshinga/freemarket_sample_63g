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
|Sales|integer||
|profile|text||
|evalution|references|foreign_key: true|
|item|references|foreign_key: true|
|todo|references|foreign_key: true|
|brand|references|foreign_key: true|


### Association
- has_many :todos, dependent: :destroy
- has_many :evalutions, dependent: :destroy
- has_many :items, dependent: :destroy
- has_one :point, dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :notices
- has_many :favorites
- has_many :item, foreign_key:buyer_id
- has_many :item, foreign_key:seller_id

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|Postal_code|integer|null: false|
|Prefecture|references||
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|user_id|references|foreign_key: true|

### Association
- has_one :user
- has_one :porefecture


## prefecturesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association
- has_one :adress



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false, add_index: true|
|discription|text||
|image|references|foreign_key: true|
|user|references|foreign_key: true|
|category|references|foreign_key: true|
|evalution|references|foreign_key: true|
|brand|references|foreign_key: true|
|condition|string||
|price|integer|null: false|
|delivery_fee|integer|null: false|
|delivery_days|integer|null: false|
|item_status|integer||
|buyer|references|foreign_key: true|
|seller|references|foreign_key: true|
### Association
- belongs_to :category
- belongs_to :user
- belongs_to :todo
- has_many :items
- has_many :comments, dependent: :destroy
- has_many :favorite, dependent: :destroy
- has_many :evalution, dependent: :destroy
- belongs_to :user, foreign_key: :buyer_id
- belongs_to :user, foreign_key: :seller_id

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|string||
|url|string||
### Association
- belongs_to :items

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
|user|references|foreign_key: true|
|item|references|foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user



## evalutionsテーブル
|Column|Type|Options|
|------|----|-------|
|rank|integer||
|user|references|foreign_key: true|
|user|references|foreign_key: true|
### Association
- belongs_to :user



## todosテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|foreign_key: true|
|user|references|foreign_key: true|
|todo_content|text||
### Association
- belongs_to :user
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user|references|foreign_key: true|
|item|references|foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|total_point|integer||
|expiration_data|integer||
|user|references|foreign_key: true|
### Association
- has_one :user
- has_many :hestories, dependent: :destroy

## hestoriesテーブル
|Column|Type|Options|
|------|----|-------|
|point|references||
|hestory_point|string||
|title|integer||
|date|string||
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

