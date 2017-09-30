class Exhibition < ApplicationRecord
  mount_uploader :images, ImageUploader
  IMAGES_PATH = File.join Rails.root, "public",
    "uploads/product_images", "image"

  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy

  belongs_to :brand, class_name: User.name, foreign_key: "brand_user_id"
  enum status: {draft: Settings.status.draft,
    published: Settings.status.published}
end
