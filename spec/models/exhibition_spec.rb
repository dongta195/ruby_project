require "rails_helper"

RSpec.describe Exhibition, type: :model do
  describe "columns" do
    it{is_expected.to have_db_column(:name).of_type :string}
    it{is_expected.to have_db_column(:description).of_type :text}
    it{is_expected.to have_db_column(:memo).of_type :text}
    it{is_expected.to have_db_column(:images).of_type :string}
    it{is_expected.to have_db_column(:total_retail_sales).of_type :integer}
    it{is_expected.to have_db_column(:total_wholesale_sales).of_type :integer}
    it{is_expected.to have_db_column(:status).of_type :integer}
  end

  describe "association" do
    it do
      is_expected.to belong_to(:brand).class_name("User")
        .with_foreign_key "brand_user_id"
    end
    it{is_expected.to have_many(:products).dependent :destroy}
    it{is_expected.to have_many(:orders).dependent :destroy}
  end
end
