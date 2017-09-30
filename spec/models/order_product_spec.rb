require "rails_helper"

RSpec.describe OrderProduct, type: :model do
  describe "columns" do
    it{is_expected.to have_db_column(:quantities).of_type :integer}
    it{is_expected.to have_db_column(:total_price).of_type :integer}
    it{is_expected.to have_db_column(:total_original_price).of_type :integer}
  end

  describe "association" do
    it{is_expected.to belong_to :order}
    it{is_expected.to belong_to :product}
    it{is_expected.to belong_to :attribute_value}
  end
end
