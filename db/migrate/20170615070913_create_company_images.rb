class CreateCompanyImages < ActiveRecord::Migration[5.1]
  def change
    create_table :company_images do |t|
      t.references :user, foreign_key: true
      t.string :product_image
      t.integer :position
      t.integer :image_type

      t.timestamps
    end
  end
end
