
## userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|unique: true, null: false|
|password|string|null: false|

## Association
has_many :confirms
has_many :credits
has_many :addresses
has_many :products

## confirmテーブル
|Column|Type|Options|
|------|----|-------|
|name_last_name|string|null: false|
|name_first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|string|null: false|
|user_id|integer||

## Association
belongs_to : user

## creditテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|string|null: false|
|expiry_date|string|null: false|
|security_code|string|null: false|
|user_id|integer||

## Association
belongs_to : user

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_name_last_name|string|null: false|
|shipping_name_first_name|string|null: false|
|shipping_last_name_kana|string|null: false|
|shipping_first_name_kana|string|null: false|
|postcode|string|null: false|
|state|string|null: false|
|city|string|null: false|
|address_line|string|null: false|
|building_name|string||
|room_number|string||
|phone_number|string||
|user_id|integer|null:false, foreign_key: true|

## Association
belongs_to : user

## productテーブル
|column|Type|Options|
|------|----|-------|
|status|integer|null: false|
|name|string|null: false|
|explanation|text|null: false|
|brand|string|null: false|
|price|string|null: false|
|shipping_date|string|null: false|
|place|string|null: false|
|user_id|integer|null:false, foreign_key: true|
|category_id|integer|null:false, foreign_key: true|

## Association
- belongs_to :category
- belongs_to :user
- has_many :images

## imageテーブル
|column|Type|Options|
|------|----|-------|
|image|text|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

## Association
- belongs_to :product

## categoryテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null: false|
|product_id|integer|null: false, foreign_key: true|

## Association
- has_many :products