class UserAddress < ApplicationRecord
  belongs_to :user

  validates :telephone, format: {with: /\A[0-9]{10}\z/}, allow_blank: true
  validates :zipcode, format: {with: /\A[0-9]{7}\z/}, allow_blank: true
end
