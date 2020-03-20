class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :status,              null: false
      t.string  :name,                null: false
      t.text    :explanation,         null: false
      t.string  :brand,               null: false
      t.integer :price,               null: false
      t.string  :shipping_date,       null: false
      t.string  :place,               null: false
      t.timestamps
    end
  end
end
