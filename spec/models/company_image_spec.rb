require "rails_helper"

RSpec.describe CompanyImage, type: :model do
  describe "columns" do
    it{is_expected.to have_db_column(:product_image).of_type :string}
    it{is_expected.to have_db_column(:position).of_type :integer}
    it{is_expected.to have_db_column(:image_type).of_type :integer}
  end

  describe "association" do
    it{is_expected.to belong_to :user}
  end
end
