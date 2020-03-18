  ## userテーブル
  |Column|Type|Options|
  |------|----|-------|
  |nickname|string|null: false|
  |email|string|unique: true, null: false|
  |password|string|null: false|

  ## Association
  has_many :confirms
  has_many :credits
  has_many :addresss
  has_many :products

  ## confirmテーブル
  |Column|Type|Options|
  |------|----|-------|
  |namemyouji|string|null: false|
  |namenamae|string|null: false|
  |friganamyouji|string|null: false|
  |frigananamae|string|null: false|
  |birthday|string|null: false|

  ## Association
  belongs_to : user

  ## creditテーブル
  |Column|Type|Options|
  |------|----|-------|
  |cardnumber|string|null: false|
  |expirydate|string|null: false|
  |securitycode|string|null: false|

  ## Association
  belongs_to : user

  ## addressテーブル
  |Column|Type|Options|
  |------|----|-------|
  |shippingnamemyouji|string|null: false|
  |shippingnamenamae|string|null: false|
  |shippingfuriganamyouji|string|null: false|
  |shippingfurigananamae|string|null: false|
  |postcode|string|null: false|
  |state|string|null: false|
  |city|string|null: false|
  |addressline|string|null: false|
  |buildingname|string||
  |roomnumber|string||
  |phonenumber|string||

  ## Association
  belongs_to : user

  ## productテーブル
  |column|Type|Options|
  |------|----|-------|
  |status|text|null: false|
  |product-name|string|null: false|
  |explanation|text|null: false|
  |bland|string|null: false|
  |price|string|null: false|
  |shipping-date|string|null: false|
  |place|string|null: false|
  |image1|text||
  |image2|text||
  |image3|text||
  |image4|text||

  ## Association
  - belongs_to :user
  - has_many :categories, through: :categories_product

  ## categoryテーブル
  |column|Type|Options|
  |------|----|-------|
  |name|string|null: false|

  ## Association
  - belong_to :products, through: :categories_product