class User < ApplicationRecord 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nikname ,presence: true
  has_one :confirm
  accepts_nested_attributes_for :confirm
  has_many :addresses
  has_many :products
  has_many :cards
  # has_many :credits
  validates :password,  length: { minimum: 7 }
  
  #productsとのアソシエーション
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Product"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Product"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Product"
end
