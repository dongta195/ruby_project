require "rails_helper"

RSpec.describe BrandBuyer, type: :model do
  describe "columns" do
    it{is_expected.to have_db_column(:rate).of_type :integer}
    it{is_expected.to have_db_column(:status).of_type :integer}
  end

  describe "association" do
    it do
      is_expected.to belong_to(:brand).class_name("User")
        .with_foreign_key "brand_user_id"
    end
    it do
      is_expected.to belong_to(:buyer).class_name("User")
        .with_foreign_key "buyer_user_id"
    end
  end
end
