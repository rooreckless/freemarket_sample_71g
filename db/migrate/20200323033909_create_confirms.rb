class CreateConfirms < ActiveRecord::Migration[5.2]
  def change
    create_table :confirms do |t|
      t.string :name_last_name,         null: false
      t.string :name_first_name,        null: false
      t.string :last_name_kana,         null: false
      t.string :first_name_kana,        null: false
      t.string :birthday,               null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
