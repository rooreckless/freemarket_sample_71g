class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :address do |t|
      t.string :shipping_name_last_name,         null: false
      t.string :shipping_name_first_name,        null: false
      t.string :shipping_first_name_kana,        null: false
      t.string :shipping_first_name_kana,        null: false
      t.string :postcode,                        null: false
      t.string :state,                           null: false                       
      t.string :city,                            null: false
      t.string :address_line,                    null: false
      t.string :building_name
      t.string :room_number
      t.string :phone_number
      t.integer :user_id,                        null:false, foreign_key: true
    end
  end
end
