require "rails_helper"

RSpec.describe Role, type: :model do
  describe "columns" do
    it{is_expected.to have_db_column(:name).of_type :string}
    it{is_expected.to have_db_column(:description).of_type :text}
  end

  describe "association" do
    it{is_expected.to have_many(:users).dependent :destroy}
  end

  describe "validation" do
    it{should validate_presence_of :name}
  end
end
