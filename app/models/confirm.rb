class Confirm < ApplicationRecord
  # validates :name_last_name, :name_first_name, :name_last_kana, :name_first_kana, :birthday,  presence: true
  belongs_to :user , optional: true
end
