class AddbuyerIdToproducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :buyer_id, :integer
    add_column :products, :saler_id, :integer
  end
end
