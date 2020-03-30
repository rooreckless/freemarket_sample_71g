class Product < ApplicationRecord
  require 'bigdecimal'

   has_many :images,dependent: :destroy
   accepts_nested_attributes_for :images, allow_destroy: true
   belongs_to :category
   belongs_to :saler, class_name: "User"
   belongs_to :buyer, class_name: "User", optional: true

  #バリデーション記述
  validates :images, presence: true
  validates :status, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :brand, presence: true
  validates :price, presence: true
  validates :place, presence: true
  validates :shipping_date, presence: true
  validates :category_id, presence: true


  #active_hash記述
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :statushash
  belongs_to_active_hash :shippinghash
  
  # 税の定数を設定(税率を変えたい場合はこちらで変更願います。)
  Taxrate = 1.1

  # 引数の値段を消費税込みに変換して返します。
  # string型の引数である商品の値段と税率(to_sへの変換が必要)を、BigDecimalに変換して計算後、小数点以下を破棄に変更)
  def self.taxingPrice(a_price)
    a_price=(BigDecimal(a_price)*BigDecimal(Taxrate.to_s)).floor
    return a_price
  end
  # 引数の値段を消費税抜きに変換して返します。
  def self.detaxingPrice(a_price)
    a_price=(BigDecimal(a_price)/BigDecimal(Taxrate.to_s)).floor
    return a_price
  end
end
