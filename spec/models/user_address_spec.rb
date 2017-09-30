require "rails_helper"

RSpec.describe UserAddress, type: :model do
  describe "columns" do
    it{is_expected.to have_db_column(:lastname).of_type :string}
    it{is_expected.to have_db_column(:firstname).of_type :string}
    it{is_expected.to have_db_column(:lastname_kana).of_type :string}
    it{is_expected.to have_db_column(:firstname_kana).of_type :string}
    it{is_expected.to have_db_column(:address).of_type :string}
    it{is_expected.to have_db_column(:building_name).of_type :string}
    it{is_expected.to have_db_column(:is_default_addr).of_type :integer}
    it{is_expected.to have_db_column(:zipcode).of_type :string}
  end

  describe "association" do
    it{is_expected.to belong_to :user}
  end
end
