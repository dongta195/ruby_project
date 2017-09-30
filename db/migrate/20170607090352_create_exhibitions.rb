class CreateExhibitions < ActiveRecord::Migration[5.1]
  def change
    create_table :exhibitions do |t|
      t.integer :brand_user_id
      t.string :name
      t.text :description
      t.string :memo
      t.string :images
      t.integer :total_retail_sales
      t.integer :total_wholesale_sales
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
