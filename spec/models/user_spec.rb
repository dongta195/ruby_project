require "rails_helper"

RSpec.describe User, type: :model do
  describe "columns" do
    it{is_expected.to have_db_column(:username).of_type :string}
    it{is_expected.to have_db_column(:description).of_type :text}
    it{is_expected.to have_db_column(:company_name).of_type :string}
    it{is_expected.to have_db_column(:company_url).of_type :string}
    it{is_expected.to have_db_column(:company_logo).of_type :string}
    it{is_expected.to have_db_column(:email).of_type :string}
  end

  describe "association" do
    it do
      is_expected.to have_many(:exhibitions).class_name("Exhibition")
        .with_foreign_key("brand_user_id").dependent :destroy
    end
    it do
      is_expected.to have_many(:orders).class_name("Order")
        .with_foreign_key("buyer_user_id").dependent :destroy
    end
    it do
      is_expected.to have_many(:brand_relationships).class_name("BrandBuyer")
        .with_foreign_key("brand_user_id").dependent :destroy
    end
    it{is_expected.to have_many(:buyers).through :brand_relationships}
    it do
      is_expected.to have_many(:buyer_relationships).class_name("BrandBuyer")
        .with_foreign_key("buyer_user_id").dependent :destroy
    end
    it{is_expected.to have_many(:brands).through :buyer_relationships}
    it{is_expected.to have_many(:company_images).dependent :destroy}
  end

  describe "validation" do
    it{should validate_presence_of :username}
  end
end
