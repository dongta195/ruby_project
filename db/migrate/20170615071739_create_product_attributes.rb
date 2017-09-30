class CreateProductAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_attributes do |t|
      t.references :product, foreign_key: true
      t.references :attribute, foreign_key: true

      t.timestamps
    end
  end
end
