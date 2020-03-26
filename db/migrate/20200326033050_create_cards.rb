class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      # t.references :user, foreign_key: true, null: false
      t.string :card_number, null: false
      t.string :expiry_date, null: false
      t.string :security_code, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
