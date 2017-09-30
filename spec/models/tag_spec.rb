require "rails_helper"

RSpec.describe Tag, type: :model do
  describe "columns" do
    it{is_expected.to have_db_column(:value).of_type(:string)}
  end

  describe "association" do
    it{is_expected.to have_many(:product_tags).dependent :destroy}
  end
end
