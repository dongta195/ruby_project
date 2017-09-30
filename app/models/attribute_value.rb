class AttributeValue < ApplicationRecord
  belongs_to :master_attribute, class_name: Attribute.name,
    foreign_key: "attribute_id"
  has_many :order_products, dependent: :nullify
end
