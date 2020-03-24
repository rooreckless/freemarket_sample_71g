class Address < ApplicationRecord
  validates :shipping_name_last_name, :shipping_name_first_name, :shipping_last_name_kana, :shipping_first_name_kana, :postcode, :state, :city, :address_line , presence: true
  belongs_to :user, optional: true
end
