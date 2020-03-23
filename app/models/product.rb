class Product < ApplicationRecord


   has_one :image, dependent: :destroy
   accepts_nested_attributes_for :image
   belongs_to :category
   belongs_to :saler, class_name: "User", optional: true
   belongs_to :buyer, class_name: "User", optional: true

  #バリデーション記述
  validates_associated :image
  validates :image, presence: true
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

end
