class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :exhibition, foreign_key: true
      t.integer :buyer_user_id
      t.integer :total_retail_sales
      t.integer :total_wholesale_sales
      t.integer :total_quantities
      t.integer :rate
      t.string :memo
      t.integer :billing_user_address_id
      t.integer :shipping_user_address_id
      t.integer :status, null: false, default: 0
      t.integer :censor, null: false, default: 0

      t.timestamps
    end
  end
end
