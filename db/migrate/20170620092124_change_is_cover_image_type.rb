class ChangeIsCoverImageType < ActiveRecord::Migration[5.1]
  def change
    change_column :product_attribute_images, :is_cover_image, :boolean,
      default: false
    change_column :product_images, :is_cover_image, :boolean, default: false
  end
end
