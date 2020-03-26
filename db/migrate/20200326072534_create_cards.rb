class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :user_id                , null: false
      t.string :buyer_id                , null: false
      t.string :card_id                 , null: false
      t.string :card_number             , null: false
      t.string :expiry_date             , null: false
      t.string :security_code           , null: false

      t.timestamps
    end
  end
end
