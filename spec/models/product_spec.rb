require "rails_helper"

RSpec.describe Product, type: :model do
  describe "columns" do
    it{is_expected.to have_db_column(:name).of_type :string}
    it{is_expected.to have_db_column(:product_no).of_type :string}
    it{is_expected.to have_db_column(:price).of_type :integer}
    it{is_expected.to have_db_column(:description).of_type :text}
    it{is_expected.to have_db_column(:order_date).of_type :datetime}
    it{is_expected.to have_db_column(:delivery_time).of_type :datetime}
    it{is_expected.to have_db_column(:status).of_type :integer}
  end

  describe "association" do
    it{is_expected.to belong_to :exhibition}
    it do
      is_expected.to belong_to(:brand).class_name("User")
        .with_foreign_key "brand_user_id"
    end
    it{is_expected.to have_many(:product_images).dependent :destroy}
    it{is_expected.to have_many(:order_products).dependent :destroy}
    it{is_expected.to have_many(:product_tags).dependent :destroy}
    it{is_expected.to have_many(:product_attributes).dependent :destroy}
  end
end
