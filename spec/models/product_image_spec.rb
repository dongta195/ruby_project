require "rails_helper"

RSpec.describe ProductImage, type: :model do
  describe "columns" do
    it{is_expected.to have_db_column(:image).of_type :string}
    it{is_expected.to have_db_column(:is_cover_image).of_type :boolean}
  end

  describe "association" do
    it{is_expected.to belong_to :product}
  end
end
