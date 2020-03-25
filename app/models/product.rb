class Product < ApplicationRecord


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

end
