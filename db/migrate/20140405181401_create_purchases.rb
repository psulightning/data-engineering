class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :count
      t.integer :purchaser_id
      t.integer :item_id
      t.integer :merchant_id
      t.timestamps
    end
  end
end
