require "rails_helper"

RSpec.describe AttributeValue, type: :model do
  describe "columns" do
    it{is_expected.to have_db_column(:value).of_type :string}
  end

  describe "association" do
    it do
      is_expected.to belong_to(:master_attribute).class_name("Attribute")
        .with_foreign_key "attribute_id"
    end
    it{is_expected.to have_many(:order_products).dependent :nullify}
  end
end
