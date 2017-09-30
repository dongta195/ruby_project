require "rails_helper"

RSpec.describe ProductAttribute, type: :model do
  describe "association" do
    it do
      is_expected.to belong_to(:master_attribute).class_name("Attribute")
        .with_foreign_key "attribute_id"
    end
    it{is_expected.to have_many(:product_attribute_images).dependent :destroy}
  end
end
