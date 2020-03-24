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
  # has_many :credits
  validates :password,  length: { minimum: 7 }
end
