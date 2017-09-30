class CompanyImage < ApplicationRecord
  belongs_to :user
  enum image_type: {company_image: Settings.brand_image_type.company_image,
    product_image: Settings.brand_image_type.product_image}

  mount_uploader :product_image, ImageUploader
end
