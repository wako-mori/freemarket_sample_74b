# freemarket DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true, index: true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|date|null: false|
|family_name_kana|string|null: false|
|first_name_kana|date|null: false|
|birthday|date|null: false|
### Association
- has_many :comments dependent: :destroy
- has_many :items dependent: :destroy
- has_many :orders dependent: :destroy
- has_many :address dependent: :destroy
- has_many :credit_card dependent: :destroy


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|integer(7)|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string|
|phone_number|string|unique: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|buyer_user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|item_id|references|null: false|
|text|text|null: false|
### Association
- belongs_to :user
- belongs_to :item


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|category|string|null: false|
|size|string||
|brand|string||
|condition|string|null: false|
|postage_player|string|null: false|
|region|string|null: false|
|preparation_days|integer|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user dependent: :destroy
- has_many   :images, dependent: :destroy
#### Validation
- validates :name, :introduction, :category, :condition, :postage_player, :region, :preparation_days, :price, presence: true
- validates :price, numericality: { only_integer: true , greater_than: 0, less_than: 9999999 }

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|reference|null: false, foreign_key: true|
### Association
- belongs_to :product, optional: true 


<<<<<<< Updated upstream
## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## item_conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## postage_playersテーブル
|Column|Type|Options|
|------|----|-------|
|postage_players|string|null: false|
### Association
- has_many :items

## regionsテーブル
|Column|Type|Options|
|------|----|-------|
|region|string|null: false|
### Association
- has_many :items

## preparation_daysテーブル
|Column|Type|Options|
|------|----|-------|
|preparation_day|string|null: false|
### Association
- has_many :items
=======
* ...
>>>>>>> Stashed changes
