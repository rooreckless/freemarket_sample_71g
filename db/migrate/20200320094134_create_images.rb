class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.belongs_to :product
      t.text :image,null: false
      t.timestamps
    end
  end
end
