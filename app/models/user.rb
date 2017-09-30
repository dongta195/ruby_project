class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
    :validatable, :timeoutable
  devise :database_authenticatable, authentication_keys: [:username]

  include Stripper

  belongs_to :role

  has_many :exhibitions, class_name: Exhibition.name,
           foreign_key: "brand_user_id", dependent: :destroy
  has_many :orders, class_name: Order.name,
           foreign_key: "buyer_user_id", dependent: :destroy
  has_many :brand_relationships, class_name: BrandBuyer.name,
           foreign_key: "brand_user_id", dependent: :destroy
  has_many :buyers, through: :brand_relationships
  has_many :buyer_relationships, class_name: BrandBuyer.name,
           foreign_key: "buyer_user_id", dependent: :destroy
  has_many :brands, through: :buyer_relationships
  has_many :company_images, dependent: :destroy
  has_many :user_addresses, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email,
    format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
             message: I18n.t("create_buyer.validate_format_email")},
            allow_blank: true
  validates :username, format: {with: /\A[a-zA-Z0-9]+\z/}
  mount_uploader :company_logo, ImageUploader

  accepts_nested_attributes_for :user_addresses, allow_destroy: true
  accepts_nested_attributes_for :company_images, allow_destroy: true,
    reject_if: :reject_images

  strip_attributes :username

  def build_reference_objects
    self.user_addresses.build is_default_addr: true
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
  end

  private
  def reject_images attributes
    attributes["product_image"].blank?
  end
end
