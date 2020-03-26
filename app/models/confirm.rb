class Confirm < ApplicationRecord
  validates :name_last_name, :name_first_name, :last_name_kana, :first_name_kana, :birthday,  presence: true
  belongs_to :user , optional: true
end
