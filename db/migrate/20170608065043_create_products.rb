class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :exhibition, foreign_key: true
      t.string :name
      t.string :product_no
      t.integer :price
      t.integer :original_price
      t.text :description
      t.datetime :order_date
      t.datetime :delivery_time
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
