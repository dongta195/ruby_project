class CreateProductAttributeImages < ActiveRecord::Migration[5.1]
  def change
    create_table :product_attribute_images do |t|
      t.references :product_attribute, foreign_key: true
      t.string :image
      t.integer :is_cover_image

      t.timestamps
    end
  end
end
