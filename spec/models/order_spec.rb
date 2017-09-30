require "rails_helper"

RSpec.describe Order, type: :model do
  describe "columns" do
    it{is_expected.to have_db_column(:total_retail_sales).of_type :integer}
    it{is_expected.to have_db_column(:total_wholesale_sales).of_type :integer}
    it{is_expected.to have_db_column(:total_quantities).of_type :integer}
    it{is_expected.to have_db_column(:rate).of_type :integer}
    it{is_expected.to have_db_column(:memo).of_type :text}
    it{is_expected.to have_db_column(:status).of_type :integer}
    it{is_expected.to have_db_column(:censor).of_type :integer}
  end

  describe "association" do
    it{is_expected.to belong_to :exhibition}
    it do
      is_expected.to belong_to(:buyer).class_name("User")
        .with_foreign_key "buyer_user_id"
    end
    it do
      is_expected.to belong_to(:billing_user_address).class_name("UserAddress")
        .with_foreign_key "billing_user_address_id"
    end
    it do
      is_expected.to belong_to(:shipping_user_address)
        .class_name("UserAddress")
        .with_foreign_key "shipping_user_address_id"
    end
    it{is_expected.to have_many(:order_products).dependent :destroy}
  end
end
