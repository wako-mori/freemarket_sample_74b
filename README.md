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
- has_many :items　dependent: :destroy
- has_many :orders dependent: :destroy
- belongs_to :address dependent: :destroy
- belong_to :credit_card dependent: :destroy


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security|integer|null: false|
|user_id|references|null: false, foreign_key: true|
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
|phone_number|integer|unique: true|
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
|image_id|references|null: false, foreign_key: true|
|name|text|null: false|
|introduction|string|null: false|
|category_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|item_condition_id|references|null: false, foreign_key: true|
|postage_player_id|references|null: false, foreign_key: true|
|region_id|references|null: false, foreign_key: true|
|preparation_day_id|references|null: false, foreign_key: true|
|price|integer|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- has_many :comments dependent: :destroy
- has_many :images dependent: :destroy
- has_many :orders dependent: :destroy
- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :size dependent: :destroy
- belongs_to :bland dependent: :destroy
- belongs_to :item_condition dependent: :destroy
- belongs_to :postage_player dependent: :destroy
- belongs_to :region dependent: :destroy
- belongs_to :preparation_day dependent: :destroy



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