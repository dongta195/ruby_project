require "rails_helper"

RSpec.describe Attribute, type: :model do
  describe "columns" do
    it{is_expected.to have_db_column(:attr_name).of_type(:string)}
  end

  describe "association" do
    it{is_expected.to have_many(:attribute_values).dependent :destroy}
    it{is_expected.to have_many(:product_attributes).dependent :destroy}
  end
end
