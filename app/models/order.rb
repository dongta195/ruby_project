class Order < ApplicationRecord
  belongs_to :exhibition
  belongs_to :buyer, class_name: User.name, foreign_key: "buyer_user_id"
  belongs_to :billing_user_address, class_name: UserAddress.name,
    foreign_key: "billing_user_address_id"
  belongs_to :shipping_user_address, class_name: UserAddress.name,
    foreign_key: "shipping_user_address_id"

  has_many :order_products, dependent: :destroy

  enum status: {draft: Settings.status.draft,
    published: Settings.status.published}
  enum censor: {waitting: Settings.order.approve_status.waitting,
    approve: Settings.order.approve_status.approve,
    reject: Settings.order.approve_status.reject}
end
