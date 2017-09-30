class CreateBrandBuyers < ActiveRecord::Migration[5.1]
  def change
    create_table :brand_buyers do |t|
      t.references :brand_user, index: true, foreign_key: {to_table: :users}
      t.references :buyer_user, index: true, foreign_key: {to_table: :users}
      t.integer :rate
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
