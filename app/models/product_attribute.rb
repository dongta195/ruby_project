class ProductAttribute < ApplicationRecord
  belongs_to :product
  belongs_to :master_attribute, class_name: Attribute.name,
    foreign_key: "attribute_id"
  has_many :product_attribute_images, dependent: :destroy
end
