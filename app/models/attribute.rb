class Attribute < ApplicationRecord
  has_many :attribute_values, dependent: :destroy
  has_many :product_attributes, dependent: :destroy
end
