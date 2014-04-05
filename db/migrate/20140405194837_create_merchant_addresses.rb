class CreateMerchantAddresses < ActiveRecord::Migration
  def change
    create_table :merchant_addresses do |t|
      t.integer :merchant_id
      t.integer :address_id

      t.timestamps
    end
  end
end
