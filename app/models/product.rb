class Product < ApplicationRecord
  has_many :product_images, dependent: :destroy
  has_many :order_products, dependent: :destroy
  has_many :product_tags, dependent: :destroy
  has_many :product_attributes, dependent: :destroy

  belongs_to :brand, class_name: User.name, foreign_key: "brand_user_id"
  belongs_to :exhibition

  enum status: {draft: Settings.status.draft,
    published: Settings.status.published}
end
