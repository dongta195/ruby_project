class BrandBuyer < ApplicationRecord
  belongs_to :brand, class_name: User.name, foreign_key: "brand_user_id"
  belongs_to :buyer, class_name: User.name, foreign_key: "buyer_user_id"
end
